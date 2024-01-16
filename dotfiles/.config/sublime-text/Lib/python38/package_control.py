import os
import sys
import zipfile

import sublime_plugin

__data_path = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))

__pkg_path = os.path.join(__data_path, 'Packages', 'Package Control', 'package_control')
__zip_path = os.path.join(__data_path, 'Installed Packages', 'Package Control.sublime-package')

__code = None

# We check the .sublime-package first, since the sublime_plugin.ZipLoader deals with overrides
if os.path.exists(__zip_path):
    __pkg_path = os.path.join(__zip_path, 'package_control')
    __file_path = os.path.join(__pkg_path, '__init__.py')

    __loader__ = sublime_plugin.ZipLoader(__zip_path)

    try:
        with zipfile.ZipFile(__zip_path, 'r') as __f:
            __code = compile(
                __f.read('package_control/__init__.py').decode('utf-8'),
                '__init__.py',
                'exec'
            )
    except (OSError, KeyError):
        pass

    # may be required before Package Control has been loaded
    events = sys.modules.get('package_control.events')
    if events is None:
        events = __loader__.load_module("Package Control.package_control.events")
        events.__name__ = 'package_control.events'
        events.__package__ = 'package_control'
        sys.modules['package_control.events'] = events

elif os.path.exists(__pkg_path):
    from importlib.machinery import SourceFileLoader

    __file_path = os.path.join(__pkg_path, '__init__.py')

    __loader__ = SourceFileLoader('package_control', __file_path)

    try:
        with open(__file_path, 'r', encoding='utf-8') as __f:
            __code = compile(__f.read(), '__init__.py', 'exec')
    except (OSError):
        pass

    # may be required before Package Control has been loaded
    events = sys.modules.get('package_control.events')
    if events is None:
        events = SourceFileLoader('events', os.path.join(__pkg_path, 'events.py')).load_module()
        events.__name__ = 'package_control.events'
        events.__package__ = 'package_control'
        sys.modules['package_control.events'] = events

    del globals()['SourceFileLoader']

if __code is None:
    raise ModuleNotFoundError("No module named 'package_control'")

__file__ = __file_path
__package__ = 'package_control'
__path__ = [__pkg_path]

# initial cleanup
del globals()['__f']
del globals()['__file_path']
del globals()['__zip_path']
del globals()['__pkg_path']
del globals()['__data_path']
del globals()['sublime_plugin']
del globals()['zipfile']
del globals()['sys']
del globals()['os']

__data = {}
exec(__code, __data)
globals().update(__data)

# Python 3.3 doesn't have __spec__
if hasattr(globals(), '__spec__'):
    __spec__.loader = __loader__
    __spec__.origin = __file__
    __spec__.submodule_search_locations = __path__
    __spec__.cached = None

# final cleanup
del globals()['__data']
del globals()['__code']
# out-dated internals
del globals()['__cached__']
