from . import pedidos

@pedidos.app_errorhandler(404)
def not_found(e):
    return "This route doesn't exist", 404