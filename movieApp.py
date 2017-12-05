import os
import sqlite3
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash

app = Flask(__name__) # create the application instance :)
app.config.from_object(__name__) # load config from this file , flaskr.py

# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'movieApp.db'),
    SECRET_KEY='development key',
    USERNAME='admin',
    PASSWORD='default'
))
app.config.from_envvar('MOVIEAPP_SETTINGS', silent=True)

def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv

def init_db():
    db = get_db()
    with app.open_resource('schema.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()

@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print('Initialized the database.')

def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db

@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()

@app.route('/', methods=['GET', 'POST'])
def login():
	db = get_db()
	if request.method == 'POST':
		loggedUser = request.form['uname']
		if db.execute('select username from User where username = ?', [loggedUser]) is None:
			return redirect(url_for('login'))
		elif request.form['psw'] != db.execute('select password from User where username = ?', [loggedUser]):
			return redirect(url_for('login'))
		else:
			show_user_profile(loggedUser)
	return render_template('MainLoginPage.html')

@app.route('/', methods=['GET', 'POST'])
def register():
	db = get_db()
	if request.method == 'POST':
		nameInput = request.form['username']
		passwordInput = request.form['password']
		if db.execute('select username from User where username = ?' [nameInput]) is None:
			db.execute('insert into User (username, password, siteURL) values (?, ?, ?)', [nameInput, passwordInput, 'http://www.imdb.com/'] )
			db.commit()
			show_user_profile(nameInput)
			return redirect(url_for('show_user_profile'))
		else:
			return redirect(url_for('register'))
	return render_template('MainLoginPage.html')

@app.route('/user/<username>')
def show_user_profile(username):
	return render_template('MainLoginPage.html', username=username)
