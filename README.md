# scons_mako
Mako Template Builder for SCons


Example Usage:

    env = Environment(tools=['default', 'makotemplate'])
    env['MAKO_DICTIONARY'] = {'MakoContextVariables': 'Value'}
    env.Mako('target.txt', 'source.txt.mako')
