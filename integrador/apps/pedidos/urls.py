from ...helpers.models import Path
from .views import index, add_pedido
url_patterns = [
    Path('/', index, ['GET']),
    Path('/add', add_pedido, ['POST']),   

]