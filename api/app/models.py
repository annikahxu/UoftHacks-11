from mongoengine import *
from flask import jsonify, request


class User(Document):
    _id = ObjectIdField(required=True)
    username = StringField(required=True, unique=True)

    pass


class Note(Document):
    _id = ObjectIdField(required=True)
    creation_time = IntField(required=True)  # Unix timestamp
    location = PointField(required=True)    # GeoJSON point
    title = StringField(required=True)
    body = StringField(required=True)
    owner = StringField(required=True)      # Username of owner
    icon = ImageField(required=True)        # Image of icon
    user = ReferenceField(User, reverse_delete_rule=CASCADE)

    def to_dict(self):
        return {
            "_id": self._id,
            "creation_time": self.creation_time,
            "location": self.location,
            "title": self.title,
            "body": self.body,
            "owner": self.owner,
            "icon": self.icon
        }

    def is_near(self, location):
        return
