# Examples

For the examples in this folder the common installation and execution details are included in this document, for details specific to the example, consult the `README.md` in that example's folder.

## Dependencies

### Conda
To install dependencies in a conda environment, execute the following commands.   The first command will install dependencies for the SCons mako builder, the second command will install documentation framework dependencies.

```bash
conda env update --file ../etc/Requirements.yaml
conda env update --file etc/Requirements.yaml
```

### Virtualenv

To install dependencies into a virtualenv execute the following commands.

```bash
python -m pip install -r ../etc/requirements.txt
python -m pip install -r etc/requirements.txt
```

## Running the Example

The following listing shows how to run the example.

```bash
# On Windows:
scons.bat

# On Linux:
scons
```

