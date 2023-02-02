from . import productos

@productos.app_errorhandler(404)
def not_found(e):
    return "This route doesn't exist", 404