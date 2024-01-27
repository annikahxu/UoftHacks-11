from flask import Flask
from pymongo import MongoClient
from flask_pymongo import PyMongo
from flask_cors import CORS
from mongoengine import connect
import os

MONGODB_USERNAME = "pat"
MONGODB_PASSWORD = "uofthacks"

MONGODB_URI = f"mongodb+srv://{MONGODB_USERNAME}:{MONGODB_PASSWORD}@cluster0.9r8z6lf.mongodb.net/"

client = MongoClient(MONGODB_URI)
db = client["uofthacks"]
user = db["user"]
note = db["note"]


def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = os.urandom(32)
    app.config['MONGO_URI'] = MONGODB_URI
    mongo = PyMongo()
    mongo.init_app(app)

    CORS(app, resources={r"/*": {"origins": "*"}})

    from .users import users
    from .notes import notes

    app.register_blueprint(users, url_prefix="/users")
    app.register_blueprint(notes, url_prefix="/notes")

    return app
