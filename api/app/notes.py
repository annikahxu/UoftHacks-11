from flask import Blueprint, jsonify, request

from .models import User, Note
from . import note

notes = Blueprint('notes', __name__, url_prefix='/notes')


@notes.route('/', methods=['POST'])
def create_note():
    data = request.json

    note = Note(
        creation_time=data['creation_time'],
        coordinates=data['coordinates'],
        title=data['title'],
        body=data['body'],
    )

    note.save()
    return "jfdsaoifjsa"


@notes.route('/<note_id>', methods=['GET'])
def get_note(note_id):
    note = note.find_one()
    return jsonify(note.to_dict())


@notes.route('/', methods=['GET'])
def get_notes():
    notes = note.find()
    return jsonify(notes)


@notes.route('/<note_id>', methods=['DELETE'])
def delete_note(note_id):
    Note.objects(id=note_id).delete()
    return


@notes.route('/nearby', methods=['GET'])
def get_nearby_notes():
    # first number is latitude, second is longitude
    coordinates = request.json['coordinates']
    nearby_notes = []
    for note in Note.objects():
        if note.is_near(coordinates):
            nearby_notes.append(note)
    return jsonify(nearby_notes)
