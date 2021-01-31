import os
from SCons.Script import SCons
from SCons.Script import Builder
from SCons.Errors import StopError

SCRIPT_PATH = os.path.dirname(os.path.realpath(__file__))


def _string(target, source, env):
    """
    String representation of Mako build step.

    Defines the message that is sent to the user when the Mako tool is
    executed.

    Args:
      target: The target to be built.
      source: The source to build from.
      env: The build environment.

    Returns:
      A string with the constructed build message.
    """
    return 'Mako(%s, %s)' % (target[0], source[0])


def _action(target, source, env):
    """
    Render a Mako template.

    Defines the actions to be executed during the build of a template.

    Args:
      target: The target to be built.
      source: The source to build from.
      env: The build environment.

    Raises:
      SCons.Errors.StopError: If the template cannot be rendered.
    """

    from mako.template import Template
    from mako import exceptions
    try:
        template_object = Template(filename=source[0].abspath)
    except:
        print(exceptions.text_error_template().render())
        raise StopError(
            "Could not load the mako template %s" %
            source[0].abspath)
    try:
        rendered = template_object.render(**env['MAKO_DICTIONARY'])
    except:
        print(exceptions.text_error_template().render())
        raise StopError(
            ("Could not render the template %s "
             "with the following dictionary.\n%s") % (
                 source[0].abspath, env['MAKO_DICTIONARY']))
    try:
        file_object = open(target[0].abspath, 'w')
        file_object.write(rendered)
        file_object.close()
    except:
        raise StopError(
            "Could not write the rendered template to %s." % target[0].abspath)


def generate(env):
    """
    Add builders and construction variables for the Mako builder.

    This method is used by SCons to insert the `Mako` tool into the provided
    build envirnment.

    Args:
      env: The build environment.
    """
    scons_action = SCons.Action.Action(
        _action, _string, varlist=['MAKO_DICTIONARY'])
    env['BUILDERS']['Mako'] = Builder(
        action=scons_action, target_factory=env.fs.File)
    env.AppendUnique(MAKO_DICTIONARY={})


def exists(env):
    """
    Make sure the tool dependencies exists.

    This will return true if the Mako tool is installed.

    Args:
      env: The build environment.

    Raises:
      SCons.Errors.StopError: If the Mako toolbox is not installed.
    """
    try:
        from mako.template import Template
    except ImportError:
        raise StopError("Could not find mako, please ensure you "
                        "have it installed on your system.")
    else:
        return True
