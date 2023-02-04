from ...helpers.models import Path
from .views import index, add_pedido, gracias

url_patterns = [
    Path('/', index, ['GET']),
    Path('/add', add_pedido, ['POST']),   
    Path('/gracias', gracias, ['GET']),
]