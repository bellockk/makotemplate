"""Top-level package for the SCons Mako Tool."""

__author__ = 'Kenneth E. Bellock'
__email__ = 'Ken.Bellock@ngc.com'

from ._version import __version__  # noqa: F401
from .makotemplate import generate
from .makotemplate import exists
__all__ = ['generate', 'exists']
