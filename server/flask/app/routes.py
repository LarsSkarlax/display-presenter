from flask import Blueprint, render_template, jsonify

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/admin')
def index2():
    return render_template('admin.html')


@main.route('/api/hello')
def hello():
    return jsonify({"message": "Hallo von Flask!"})
