from ...helpers.models import Path
from .views import index, add_product, get_product, update_product, delete_product 

url_patterns = [
    Path('/', index, ['GET']),    
    Path('/add_product', add_product, ['POST']),
    Path('/edit/<id>', get_product, ['GET', 'POST']),
    Path('/update/<id>', update_product, ['POST']),
    Path('/delete/<string:id>', delete_product, ['GET', 'POST']),
]



