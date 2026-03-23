import pathspec
import argparse
import os
import toml
import shutil
import pathlib
import re
import sys



# gitignore style pattern relative to repo root
publish_ignore_files = """
/packages
/example_tudapub.pdf
/example_tudapub.typ
/.typos.toml

/.git/
/scripts/

/tests/
/tud_design_guide/

/templates_examples/*/logos/*
!/templates_examples/*/logos/*.sh
!/templates_examples/*/logos/*logo_replace.svg
/templates_examples/*/fonts/*
!/templates_examples/*/fonts/*.sh
/templates_examples/*/template
/templates_examples/*/*.pdf

/common/
/assets/

.DS_Store
.venv
.vscode

"""

# template folder names
templates = [
    'tudapub',
    'tudaexercise',
    'not-tudabeamer-2023'
]


# set working dir to repo root
script_folder = os.path.dirname(os.path.realpath(__file__))
repo_root = script_folder + '/..'
os.chdir(repo_root)

ignore_pattern = pathspec.PathSpec.from_lines(
    pathspec.patterns.GitWildMatchPattern,
    publish_ignore_files.splitlines()
)



# cmd args
parser = argparse.ArgumentParser(
    prog='Typst Package Publisher',
    description='Copies this repo to typst local packages or locally cloned typst-packages while not copying the ignored files.'
)
parser.add_argument('--local', action='store_true',
                    help='copy to $TYPST_PACKAGE_ROOT/typst/packages/local/<PACKAGE_NAME>/<VERSION>.99')
parser.add_argument('--clean-dist-folder-force', action='store_true',
                    help='Delete the contents of the destinatio folder before copying without asking. ')
parser.add_argument('--universe', type=str,
                    help='copy to GIVEN_TYPST_PACKAGES_LOCAL_REPO_PATH//<PACKAGE_NAME>/<VERSION>',
                    metavar='GIVEN_TYPST_PACKAGES_LOCAL_REPO_PATH')
parser.add_argument('--not-clean-dist-folder', action='store_true',
                    help='Not delete the contents of the destinatio folder before copying.')
parser.add_argument('--template', type=str,
                    help='If set only publish the template with this name, otherwise all templates.')
args = parser.parse_args()


# get copy destination
copy_dest_dir = None
if not (args.local ^ (args.universe is not None)):
    print('Error: you must either set target to local or universe')
    parser.print_usage()
    exit(0)

if args.local:
    if sys.platform.startswith("linux"):
        copy_dest_dir = str(pathlib.Path.home()) + "/.local/share/typst/packages/local/"
    elif sys.platform.startswith("win32"):
        copy_dest_dir = os.getenv("APPDATA") + "/typst/packages/local/"
    elif sys.platform.startswith("darwin"):
        copy_dest_dir = str(pathlib.Path.home()) + "/Library/Application Support/typst/packages/local/"
    else:
        print('Error: Unsupported platform')
        exit(0)
elif args.universe is not None:
    copy_dest_dir = args.universe + '/packages/preview/'


def copy_by_ignore_pattern(root, pattern: str, copy_dest_dir):
    ignore_pattern = pathspec.PathSpec.from_lines(
        pathspec.patterns.GitWildMatchPattern,
        pattern.splitlines()
    )
    # filter files and also resolve symlinks
    for match in ignore_pattern.match_tree_files(root=root, negate=True):
        dest = copy_dest_dir / match
        print(f'  - copy {match} to {dest}')
        os.makedirs(pathlib.Path(dest).parent, exist_ok=True)
        shutil.copy(match, dest)


def delete_by_ignore_pattern(root, pattern: str):
    ignore_pattern = pathspec.PathSpec.from_lines(
        pathspec.patterns.GitWildMatchPattern,
        pattern.splitlines()
    )
    # filter files and also resolve symlinks
    for match in ignore_pattern.match_tree_files(root=root, negate=False):
        orig = root / match
        print(f'  - remove {orig}')
        #os.remove(orig)


def copy_template(copy_dest_dir, template_folder_name = 'tudapub'):
    template_folder = pathlib.Path('templates') / template_folder_name

    # read typt.toml
    typst_toml = toml.load(template_folder / 'typst.toml')
    package_name = typst_toml['package']['name']
    package_version = typst_toml['package']['version']
    package_repository = typst_toml['package']['repository']

    copy_dest_dir += f"{package_name}/{package_version}"
    copy_dest_dir = pathlib.Path(copy_dest_dir)

    print(f'>> will copy to {copy_dest_dir} ...')


    if (not args.not_clean_dist_folder) and pathlib.Path(copy_dest_dir).exists():
        print(f'>> first will remove all in {copy_dest_dir} ...')
        if not args.clean_dist_folder_force and input('>> Are you sure to remove this folder? [n/y]') != 'y':
            exit(1)
        shutil.rmtree(copy_dest_dir)

    os.makedirs(copy_dest_dir, exist_ok=True)

    # filter files and also resolve symlinks
    copy_by_ignore_pattern(repo_root, publish_ignore_files, copy_dest_dir)
    delete_by_ignore_pattern(copy_dest_dir, f"""
    /templates_examples/*/logos/*
    !/templates_examples/*/logos/*.sh
    /templates_examples/*/fonts/*
    !/templates_examples/*/fonts/*.sh
    """)


    # now move template sub-folder to root dir and remove other templates
    dest_template_folder = copy_dest_dir / 'templates' / template_folder_name
    for src_file in os.listdir(dest_template_folder):
        src_path = os.path.join(dest_template_folder, src_file)
        print(f" - move {src_path} to ./")
        shutil.move(src_path, copy_dest_dir)
    # remove template folder
    shutil.rmtree(copy_dest_dir / 'templates')

    # copy example
    examples_folder = copy_dest_dir / 'templates_examples'
    shutil.copytree(examples_folder / template_folder_name, copy_dest_dir / 'example')
    shutil.rmtree(examples_folder)


    # replace markdown links in readme -> add full repo path in front
    links_to_replace_with_repo_path = [
        'templates/tudaexercise/template/tudaexercise.typ',
        'templates/tudapub/template/tudapub.typ',
        'templates/not-tudabeamer-2023/template/lib.typ',
        'templates_examples/tudaexercise/main.typ',
        'example_tudapub.pdf',
        'example_tudapub.typ',
        'templates_examples/not-tudabeamer-2023/main.typ',
    ]
    repo_path = package_repository + '/blob/main/'
    print('\n>> will replace links in the REAMDME.md')
    link_regex = re.compile(r'\[([^\]]+)\]\(([^)]+)\)')
    with open(copy_dest_dir / "README.md", "r+") as readme:
        c = readme.read()
        links = list(link_regex.finditer(c)) #findall(c))

        def replace(match):
            out_full = match.group()
            out_split = out_full.split('(')
            assert len(out_split) == 2, "can't parse link: " + out_full
            for replace_str in links_to_replace_with_repo_path:
                out_split[-1] = out_split[-1] .replace(replace_str, repo_path + replace_str)
            out_full = '('.join(out_split)
            print('  - new link: ' + out_full)
            return out_full

        c = link_regex.sub(replace, c)

        # replace image links in readme
        img_tag_start = '<img src="'
        repo_path_raw = package_repository.replace('https://github.com/', 'https://raw.githubusercontent.com/') + '/refs/heads/main/'
        c = c.replace(img_tag_start, img_tag_start + repo_path_raw)

        # overwrite
        readme.seek(0)
        readme.write(c)
        readme.truncate()


if args.template:
    if args.template not in templates:
        print(f'> template {args.template} not valid. Has to be one of {templates}')
        exit(1)
    templates = [
        args.template
    ]

for name in templates:
    copy_template(copy_dest_dir=copy_dest_dir, template_folder_name=name)
