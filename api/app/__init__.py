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
users = db["users"]
notes = db["notes"]


def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = os.urandom(32)
    app.config['MONGO_URI'] = MONGODB_URI
    mongo = PyMongo()
    mongo.init_app(app)

    CORS(app, resources={r"/*": {"origins": "*"}})

    from .views import views

    app.register_blueprint(views, url_prefix="/")

    return app
