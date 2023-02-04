from flask import render_template, make_response, request, redirect, url_for, flash, session
import psycopg2 #pip install psycopg2 
import psycopg2.extras

host =     'localhost'
database = 'login'
username = 'postgres'
password = '1234'
port =      5432
 
conn = psycopg2.connect(host=host, database=database,
                   user=username, password=password, port=port)

# index
def index():      
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)   
    s1 = "SELECT * FROM productos"
    cur.execute(s1)
    list_products = cur.fetchall()
    template = render_template('pedidos/index.html', list_products = list_products)
    response = make_response(template)
    return response

# pedido
def gracias():
    use = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if 'loggedin' in session:
        use.execute('SELECT * FROM users WHERE id = %s', [session['id']])
        usuarios = use.fetchone()
        # Show the profile page with account info
        return render_template('pedidos/gracias.html', usuarios=usuarios)
    # User is not loggedin redirect to login page    
    template = render_template("users/login.html")
    response = make_response(template)
    return response  

# añadir pedido
def add_pedido():
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method == 'POST':
        idproductos = request.form['idproductos']        
        cantidad    = request.form['cantidad']       
        cur.execute("INSERT INTO pedidos (idproductos, cantidad) VALUES (%s,%s)", (idproductos, cantidad))
        conn.commit()       
        return redirect(url_for('pedidos.index'))





