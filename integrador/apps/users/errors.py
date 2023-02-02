from . import users

@users.app_errorhandler(404)
def not_found(e):
    return "Esta Pagina No existe", 404