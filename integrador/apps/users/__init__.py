from flask import Blueprint
from .urls import url_patterns

users = Blueprint("users", __name__, url_prefix="/users")

for path in url_patterns:
    users.add_url_rule(rule=path.url, view_func=path.view_func, methods=path.methods)

from .errors import *