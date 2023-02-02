from .helpers.models import Path
from .views import index, profile, nosotros, servicios, laptos, celulares, componentes, accesorios


url_patterns = [
    Path('/', index, ['GET']),
    Path('/profile', profile, ['GET']),
    Path('/nosotros', nosotros, ['GET']),
    Path('/servicios', servicios, ['GET']),
    Path('/laptos', laptos, ['GET']),
    Path('/celulares', celulares, ['GET']),
    Path('/componentes', componentes, ['GET']),
    Path('/accesorios', accesorios, ['GET']),
]