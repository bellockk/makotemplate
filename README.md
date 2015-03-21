# SCons Mako Build Tool
Mako Template Builder for SCons


Example Usage:
```python
env = Environment(tools=['default', 'makotemplate'])
env['MAKO_DICTIONARY'] = {'MakoContextVariables': 'Value'}
env.Mako('target.txt', 'source.txt.mako')
```
