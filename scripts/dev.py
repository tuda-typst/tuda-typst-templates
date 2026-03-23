#!/usr/bin/env python3
import os
import re
import sys
from pathlib import Path
import tomllib

def get_version(toml_path: Path) -> str:
    with open(toml_path, "rb") as f:
        data = tomllib.load(f)
        return data["package"]["version"]

def main():
    script_path = Path(__file__).resolve()
    root_dir = script_path.parent.parent

    packages = [
        {
            "name": "athena-tu-darmstadt-exercise",
            "template": "tudaexercise"
        },
        {
            "name": "athena-tu-darmstadt-thesis",
            "template": "tudapub"
        },
        {
            "name": "not-tudabeamer-2023",
            "template": "not-tudabeamer-2023"
        }
    ]

    for pkg in packages:
        template_dir = root_dir / "templates" / pkg["template"]
        toml_path = template_dir / "typst.toml"

        version = get_version(toml_path)

        preview_dir = root_dir / "packages" / "preview" / pkg["name"]
        preview_dir.mkdir(parents=True, exist_ok=True)

        link_path = preview_dir / version

        target_path = Path("..", "..", "..", "templates", pkg["template"])

        if link_path.is_symlink():
            link_path.unlink()

        print(f"Linking {pkg['name']}/{version} -> {pkg['template']}")
        try:
            link_path.symlink_to(target_path, target_is_directory=True)
        except OSError as e:
            print(f"\nFailed to create symlink: {e}")
            if os.name == 'nt':
                print("---")
                print("Windows Tip: To create symlinks, you must either:")
                print("1. Enable 'Developer Mode' in Windows Settings (Privacy & security > For developers)")
                print("2. Run your terminal/command prompt as Administrator.")
            sys.exit(1)

    print("Successfully created all template symlinks.")

if __name__ == "__main__":
    main()
