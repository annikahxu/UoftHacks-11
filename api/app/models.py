from mongoengine import *
from flask import jsonify, request
import math


class User(Document):
    _id = ObjectIdField(required=True)
    username = StringField(required=True, unique=True)

    pass


class Note(Document):
    _id = ObjectIdField(required=True)
    creation_time = IntField(required=True)  # Unix timestamp
    location = ListField(FloatField(), required=True)  # [latitude, longitude]
    title = StringField(required=True)
    body = StringField(required=True)
    # icon = ImageField(required=True)        # Image of icon
    # user = ReferenceField(User, reverse_delete_rule=CASCADE)

    def to_dict(self):
        return {
            "_id": self._id,
            "creation_time": self.creation_time,
            "location": self.location,
            "title": self.title,
            "body": self.body,
        }

    def is_near(self, coordinates):
        return Note.haversine(self.location, coordinates) <= 1000

    @staticmethod
    def haversine(coord1, coord2):
        # Coordinates in decimal degrees (e.g. 43.60, -79.49)
        lat1, lon1 = coord1
        lat2, lon2 = coord2

        R = 6371000  # radius of Earth in meters
        phi1 = math.radians(lat1)
        phi2 = math.radians(lat2)

        delta_phi = math.radians(lat2 - lat1)
        delta_lambda = math.radians(lon2 - lon1)

        a = math.sin(delta_phi / 2)**2 + \
            math.cos(phi1) * math.cos(phi2) * \
            math.sin(delta_lambda / 2)**2

        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))

        distance = R * c  # output distance in meters
        return distance
