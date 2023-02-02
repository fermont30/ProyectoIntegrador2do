import os
import importlib
from flask import Flask
from .config import config
from .urls import url_patterns

app = Flask(__name__)
app.config.from_object(config['development']) # Change it to production for production use

_apps = {}
apps_folder = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'apps')

if os.path.exists(apps_folder):
    for path in os.listdir(apps_folder):
        module_path = os.path.join(apps_folder, path)
        if os.path.isdir(module_path) and not path.startswith('__'):
            module = importlib.import_module(f'.{path}', package=f"{app.name}.apps")
            try:
                _apps[path] = getattr(module, path)
            except:
                print(f"[-] Filed to import blueprint from 'apps/{path}' directory.")
                

for _key, _module in _apps.items():
    try:
        app.register_blueprint(_module)
    except Exception as e:
        print(f'[-] Failed to register blueprint {_key}. Reason :', e)

for path in url_patterns:
    app.add_url_rule(rule=path.url, view_func=path.view_func, methods=path.methods)