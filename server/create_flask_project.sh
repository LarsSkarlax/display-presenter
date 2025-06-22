#!/bin/bash

# Name des Projekts vom ersten Argument
PROJECT_NAME=${1:-mein_flask_projekt}

echo "📁 Erstelle Flask-Projekt: $PROJECT_NAME"
mkdir -p "$PROJECT_NAME"/app/{templates,static}
cd "$PROJECT_NAME" || exit

# requirements.txt
cat > requirements.txt <<EOF
Flask==3.0.0
EOF

# config.py
cat > config.py <<EOF
DEBUG = True
SECRET_KEY = 'ein_geheimer_schlüssel'
EOF

# run.py
cat > run.py <<EOF
from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
EOF

# app/__init__.py
cat > app/__init__.py <<EOF
from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config.from_pyfile('../config.py')

    from .routes import main
    app.register_blueprint(main)

    return app
EOF

# app/routes.py
cat > app/routes.py <<EOF
from flask import Blueprint, render_template, jsonify

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')

@main.route('/api/hello')
def hello():
    return jsonify({"message": "Hallo von Flask!"})
EOF

# app/templates/index.html
cat > app/templates/index.html <<EOF
<!doctype html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <title>Startseite</title>
</head>
<body>
  <h1>Willkommen bei deinem Flask-Projekt!</h1>
  <p>Hier ist dein Einstiegspunkt: <code>app/templates/index.html</code></p>
</body>
</html>
EOF

echo "✅ Projektstruktur erstellt!"
echo "👉 Als nächstes:"
echo "cd $PROJECT_NAME"
echo "python3 -m venv venv && source venv/bin/activate"
echo "pip install -r requirements.txt"
echo "python run.py"
