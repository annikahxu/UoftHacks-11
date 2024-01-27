from mongoengine import *
from flask import jsonify, request


class Note(Document):
    creation_time = IntField(required=True)  # Unix timestamp
    location = PointField(required=True)    # GeoJSON point
    title = StringField(required=True)
    body = StringField(required=True)
    owner = StringField(required=True)      # Username of owner
    icon = ImageField(required=True)        # Image of icon

    def to_json(self):
        return {
            "creation_time": self.creation_time,
            "location": self.location,
            "title": self.title,
            "body": self.body,
            "owner": self.owner,
            "icon": self.icon
        }


class User(Document):
    pass
