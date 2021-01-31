# Acceptance Tests for the SCons Mako Template Rendering Tool

The following sections provide instruction on how to create a test environment and execute the test framework.  All tests are exectued in a sandbox to ensure tests do not interact with each other.

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

### Virtualenv

To install dependencies in a virtual environement, execute the following commands.

```bash
python -m pip install -r ../../etc/requirements.txt
python -m pip install -r ../../example/etc/requirements.txt
python -m pip install -r etc/requirements.txt
```

## Executing the test framework

To run all of the tests, execute the following.

```bash
# On Windows
bin/run.bat

# On Linux
bin/run
```

You can get a full list of test running options by requesting help as shown in the following listing.

```bash
# On Windows
bin/run.bat --help

# On Linux
bin/run --help
```

For example, to run a single test, `MAKO-001`, execute the following.

```bash
# On Windows
bin/run.bat --test MAKO-001

# On Linux
bin/run --test MAKO-001
```

Test logs and result summaries are generated in the `dist` folder, any failed tests will will have the test sandbox captured in the `dist/failed` folder under a subfolder by the same name as the test name that failed.
