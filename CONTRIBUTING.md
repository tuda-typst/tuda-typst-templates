# Contributing

## Development Setup

To develop against your local changes, first run the python script to create local symlinks in a `packages/` folder that is then used by Typst. You only need to run the script once per version bump. Then start your editor / `typst` with the environment variable set to an absolute path to that folder.
```bash
python3 ./scripts/dev.py
TYPST_PACKAGE_PATH=$PWD/packages code .
```

To run tests / examples against the released version, simply start your editor / `typst` without the environment variable set. This can be useful to verify that your code changes did not have unintended effects.
```bash
code .
```

## VS Code Setup (Optional)

The repository includes recommended extensions in [.vscode/extensions.json](.vscode/extensions.json) and shared defaults in [.vscode/settings.default.json](.vscode/settings.default.json).

If not prompted, you can press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac) and select "Extensions: Show Recommended Extensions" to see the list of recommended extensions.

Using the recommended extensions gives you formatter defaults consistent with the repository (including typstyle width), while still letting you override settings locally if needed.

## Pre-commit Hooks

This repository uses [pre-commit](https://pre-commit.com/) hooks to automatically check and format code before commits. The hooks are defined in [.pre-commit-config.yaml](.pre-commit-config.yaml) and are enforced in CI via [.github/workflows/check.yml](.github/workflows/check.yml). For PRs, we require that all checks pass before merging.

### Step 1: Install pre-commit

Install [pre-commit](https://pre-commit.com/) in a way that fits your system and environment policy (for example: `pipx`, `pip`, a virtual environment, or your OS package manager).

If you use Python tooling, one common option is:

```bash
pip install pre-commit
```

Verify that it is available:

```bash
pre-commit --version
```

### Step 2: Register repository hooks

Install the git hook scripts into `.git/hooks`:

```bash
pre-commit install
```

This installs the local Git hook so configured checks run automatically before each `git commit`.

### Step 3: Run hooks manually

Run all configured hooks on all tracked files:

```bash
pre-commit run -a
```

Useful to run once before committing; this mirrors CI behavior and catches issues early.

### Requirements

Before running the hooks, ensure `typstyle` is installed and available on your `PATH`.

Install [typstyle](https://github.com/typstyle-rs/typstyle) using any supported installation method for your system (for example, Rust `cargo`, binaries, or a package manager).

If you use Rust tooling, one common option is:

```bash
cargo install typstyle
```

Verify installation:

```bash
typstyle --version
```

This is currently required because the local `typstyle` hook uses your system installation (see [this issue](https://github.com/typstyle-rs/typstyle/issues/460)). Without it, the pre-commit hook will fail when it encounters `.typ` files.

### Testing GitHub Actions Locally

To develop and test GitHub Actions workflows locally, you can use [act](https://github.com/nektos/act):

Install `act` using any supported method for your platform (package manager or binary install), then verify:

```bash
act --version
```

Run the workflow event locally, for example:

```bash
act -j check
```

This runs the `check` job locally, which is useful when iterating on workflow changes before pushing.
