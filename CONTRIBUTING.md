# Contributing

Run once (per version bump):
```bash
./scripts/dev.sh
```

For running the tests/examples against your changes:
```bash
TYPST_PACKAGE_PATH=$PWD/packages code .
```

For running the tests/examples against the released version (e.g. to test for regressions):
```bash
code .
```

## Publish locally

For creating a local package you need to use the `scripts/publish.py` script.
```python
python ./scripts/publish.py --local
```
