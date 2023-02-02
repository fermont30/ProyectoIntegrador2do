from flask import render_template, make_response, request, redirect, url_for, flash
import psycopg2 #pip install psycopg2 
import psycopg2.extras

host =     'localhost'
database = 'login'
username = 'postgres'
password = '1234'
port =      5432
 
conn = psycopg2.connect(host=host, database=database,
                   user=username, password=password, port=port)

def index():
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cat = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)    
    s = "select productos.id, productos.nombre, productos.precio, productos.descripcion, categoria.descripcion from productos, categoria where categoria.idcat = productos.idcat"    
    s1 = "SELECT * FROM categoria"
    cur.execute(s) # Execute the SQL
    cat.execute(s1) 
    list_products = cur.fetchall()
    list_cat      = cat.fetchall()
    template = render_template('productos/index.html', list_products=list_products, list_cat=list_cat)
    response = make_response(template)
    return response        

#añadir producto
def add_product():
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method == 'POST':
        nombre      = request.form['nombre']
        precio      = request.form['precio']
        descripcion = request.form['descripcion']
        idcat       = request.form['idcat']
        cur.execute("INSERT INTO productos (nombre, precio, descripcion, idcat) VALUES (%s,%s,%s,%s)", (nombre, precio, descripcion, idcat))
        conn.commit()
        flash('Producto agregado con Exito!!')
        return redirect(url_for('productos.index'))

# pagina editar
def get_product(id):
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor) 
    cat = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)     
    cur.execute(f"SELECT * FROM productos WHERE id = {id}") 
    s1 = "SELECT * FROM categoria" 
    cat.execute(s1)   
    data  = cur.fetchall()   
    list_cat      = cat.fetchall()     
    cur.close()    
    print(data[0])    
    template = render_template('productos/edit.html', articulos= data[0], list_cat=list_cat)
    response = make_response(template)
    return response

# editar producto
def update_product(id):
   if request.method == 'POST':
        nombre      = request.form['nombre']
        precio      = request.form['precio']
        descripcion = request.form['descripcion'] 
        idcat       = request.form['idcat']        
        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)                
        cur.execute("""
            UPDATE productos
            SET nombre = %s,
                precio = %s,
                descripcion = %s,
                idcat = %s
            WHERE id = %s            
        """, (nombre, precio, descripcion, idcat, id))
        flash('Producto actializado con Exito!!')
        conn.commit()
        return redirect(url_for('productos.index'))

#eliminar producto
def delete_product(id):
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)   
    cur.execute('DELETE FROM productos WHERE id = {0}'.format(id))
    conn.commit()
    flash('Producto Eliminado!!')
    return redirect(url_for('productos.index'))