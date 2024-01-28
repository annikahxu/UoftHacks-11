from flask import Blueprint, jsonify, request
from bson import ObjectId
import time

from .models import User, Note
from . import note

notes = Blueprint('notes', __name__, url_prefix='/notes')

@notes.route('/', methods=['GET', 'POST'])
def create_note():
    data = request.json

    note = Note(
        creation_time=int(time.time()),
        coordinates=data['coordinates'],
        title=data['title'],
        body=data['body'],
    )

    note.save()
    return 200


@notes.route('/<note_id>', methods=['GET'])
def get_note(note_id):
    note = note.find_one({'_id': ObjectId(note_id)})
    note.pop('_id')
    return jsonify(note.to_dict())


@notes.route('/', methods=['GET'])
def get_notes():
    notes = Note.objects()
    notes_json = [note.to_mongo().to_dict() for note in notes]
    for note_json in notes_json:
        note_json['id'] = str(note_json['_id'])
        note_json.pop('_id')
    return (jsonify(notes_json))


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
            nearby_notes.append(note.to_mongo().to_dict())
    for note_json in nearby_notes:
        note_json['id'] = str(note_json['_id'])
        note_json.pop('_id')
    return jsonify(nearby_notes)
