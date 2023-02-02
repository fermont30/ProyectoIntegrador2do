from flask import render_template, make_response
from flask import request, redirect, url_for, session
import psycopg2
import psycopg2.extras

host     = 'localhost'
database = 'login'
username = 'postgres'
password = '1234'
port     =  5432
 
conn = psycopg2.connect(host=host, database=database,
                   user=username, password=password, port=port)


def index():
    template = render_template("index.html")
    response = make_response(template)
    return response

def profile(): 
    cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)   
    # Check if user is loggedin
    if 'loggedin' in session:
        cursor.execute('SELECT * FROM users WHERE id = %s', [session['id']])
        account = cursor.fetchone()
        # Show the profile page with account info
        return render_template('profile.html', account=account)
    # User is not loggedin redirect to login page    
    template = render_template("users/login.html")
    response = make_response(template)
    return response

def nosotros():
    template = render_template("nosotros.html")
    response = make_response(template)

    return response

def servicios():
    template = render_template("servicios.html")
    response = make_response(template)
    return response

def laptos():
    template = render_template("categorias/laptos.html")
    response = make_response(template)
    return response

def celulares():
    template = render_template("categorias/celulares.html")
    response = make_response(template)
    return response

def componentes():
    template = render_template("categorias/componentes.html")
    response = make_response(template)
    return response

def accesorios():
    template = render_template("categorias/accesorios.html")
    response = make_response(template)
    return response