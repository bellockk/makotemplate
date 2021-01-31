import os
import sys
import platform

_SCRIPT_PATH = os.path.abspath(os.path.dirname(__file__))
PYTHON = sys.executable
SCONS = f"scons{'.bat' * platform.system().lower().startswith('win')}"
RESOURCES = os.path.abspath(os.path.join(_SCRIPT_PATH, '..', 'etc'))
