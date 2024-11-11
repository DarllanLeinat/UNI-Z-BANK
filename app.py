from flask import Flask, render_template, request, redirect, url_for, jsonify
from flask_sqlalchemy import SQLAlchemy
import os

# Configuração do Flask e banco de dados
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Modelos do banco de dados
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)
    rg = db.Column(db.String(20), nullable=False)
    cpf = db.Column(db.String(20), nullable=False)
    account_number = db.Column(db.String(20), unique=True, nullable=False)
    city = db.Column(db.String(80), nullable=False)
    phone = db.Column(db.String(20), nullable=False)
    dob = db.Column(db.String(20), nullable=False)
    balance = db.Column(db.Float, default=0.00)
    credit_limit = db.Column(db.Float, default=1000.00)

# Função para inicializar o banco de dados
@app.before_request
def create_tables():
    if not os.path.exists('database.db'):
        db.create_all()

# Rota para o index
@app.route('/')
def index():
    return render_template('index.html')

# Rota para o login
@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    user = User.query.filter_by(username=username, password=password).first()

    if user:
        return redirect(url_for('options', user_id=user.id))
    return jsonify({"message": "Usuário ou senha incorretos."}), 401

# Rota para o registro
@app.route('/register', methods=['POST'])
def register():
    username = request.form['username']
    password = request.form['password']
    rg = request.form['rg']
    cpf = request.form['cpf']
    account_number = request.form['account_number']
    city = request.form['city']
    phone = request.form['phone']
    dob = request.form['dob']

    if User.query.filter_by(username=username).first():
        return jsonify({"message": "Nome de usuário já existe."}), 400

    new_user = User(username=username, password=password, rg=rg, cpf=cpf, account_number=account_number,
                    city=city, phone=phone, dob=dob)
    db.session.add(new_user)
    db.session.commit()

    return redirect(url_for('login'))

# Rota para a tela de opções
@app.route('/options/<int:user_id>')
def options(user_id):
    user = User.query.get_or_404(user_id)
    return render_template('index.html', user=user)

# Função para realizar depósito
@app.route('/deposit', methods=['POST'])
def deposit():
    user_id = request.form['user_id']
    amount = float(request.form['amount'])
    user = User.query.get_or_404(user_id)

    user.balance += amount
    db.session.commit()

    return jsonify({"message": "Depósito realizado com sucesso.", "new_balance": user.balance})

# Função para realizar saque
@app.route('/withdraw', methods=['POST'])
def withdraw():
    user_id = request.form['user_id']
    amount = float(request.form['amount'])
    user = User.query.get_or_404(user_id)

    if amount <= 0 or amount > user.balance:
        return jsonify({"message": "Saldo insuficiente ou valor inválido."}), 400

    user.balance -= amount
    db.session.commit()

    return jsonify({"message": "Saque realizado com sucesso.", "new_balance": user.balance})

if __name__ == '__main__':
    app.run(debug=True)
