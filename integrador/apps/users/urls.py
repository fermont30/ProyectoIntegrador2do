from ...helpers.models import Path
from .views import index, register, login, logout


url_patterns = [
    Path('/', index, ['GET']),
    Path('/register', register, ['GET', 'POST']),
    Path('/login', login, ['GET', 'POST']),
    Path('/logout', logout, ['GET']),
]