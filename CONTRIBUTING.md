# Contributing

To develop against your local changes, first run the python script to create local symlinks in a `packages/` folder that is then used by Typst. You only need to run the script once per version bump. Then start your editor / `typst` with the environment variable set to an absolute path to that folder.
```bash
python3 ./scripts/dev.py
TYPST_PACKAGE_PATH=$PWD/packages code .
```

To run tests / examples against the released version, simply start your editor / `typst` without the environment variable set. This can be useful to verify that you code changes did not have unintended effects. 
```bash
code .
```
