from flask import Blueprint
from .urls import url_patterns

productos = Blueprint("productos", __name__, url_prefix="/productos")

for path in url_patterns:
    productos.add_url_rule(rule=path.url, view_func=path.view_func, methods=path.methods)

from .errors import *