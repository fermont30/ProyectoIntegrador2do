from flask import Blueprint
from .urls import url_patterns

pedidos = Blueprint("pedidos", __name__, url_prefix="/pedidos")

for path in url_patterns:
    pedidos.add_url_rule(rule=path.url, view_func=path.view_func, methods=path.methods)

from .errors import *