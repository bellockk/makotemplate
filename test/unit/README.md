# Unit Tests for the SCons Mako Template Rendering Tool

The following sections provide instruction on how to create a test environment and execute the test framework.

---

**NOTE**

All relative paths referenced in this file are relative to the directory containing this readme.

---

## Dependencies

### Conda

To install dependencies in a conda environment, execute the following commands.

```bash
conda env update --file ../../etc/Requirements.yaml
conda env update --file ../../example/etc/Requirements.yaml
conda env update --file etc/Requirements.yaml
```

### Virualenv

To install dependencies in a virtual environment, execute the following commands.

```bash
python -m pip install -f ../../etc/requirements.txt
python -m pip install -f ../../example/etc/requirements.txt
python -m pip install -f etc/requirements.txt
```

## Executing the test framework

To run all of the tests, execute the following.

```bash
nose2
```

To get a more verbose output you can pass the `-v` flag to `nose2`.

```bash
nose2 -vv
```
