# SCons Mako Build Tool
Mako Template Builder for SCons


Example Usage:
```python
env = Environment(tools=['default', 'makotemplate'])
env['MAKO_DICTIONARY'] = {'MakoContextVariables': 'Value'}
env.Mako('target.txt', 'source.txt.mako')
```

Would render the template file *source.txt.mako*
```
Replace a ${MakoContextVariables}.
```

To the file *source.txt*
```
Replace a value.
```
