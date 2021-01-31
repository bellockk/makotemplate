# SCons Mako Build Tool
Mako Template Builder for SCons

## Dependencies

### Conda
To install dependencies in a conda environment, execute the following commands.

```bash
conda env update --file etc/Requirements.yaml
```

### Virtualenv

To install dependencies into a virtualenv execute the following commands.

```bash
python -m pip install -r etc/requirements.txt
```

## Usage

### Add the `makotemplate` Tool to the SCons Path

In the following example, the `makotemplate` tool is found within the `contrib` subdirectory.

```python
import SCons
SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('contrib'))
```

### Create a Build Environment with the `makotemplate` Tool

```python
env = Environment(tools=['default', 'makotemplate'])
```

### Define a Mako Build Target

```python
env.Mako('target.txt', 'source.txt.mako',
    MAKO_DICTIONARY={'MakoContextVariables': 'Value'})
```

Which, when run, would render the template file *source.txt.mako*
```
Replace a ${MakoContextVariables}.
```

To the file *source.txt*
```
Replace a value.
```

---
**Note**

If your Mako template loads ohter files, make sure to explicitely define those dependencies in your SCons scripts.

```python
mako = env.Mako('target.txt', 'source.txt.mako',
    MAKO_DICTIONARY={'MakoContextVariables': 'Value'})
env.Depends(mako, [env.File('file_loaded_by_template.csv')])
```

---
