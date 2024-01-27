from flask import Blueprint, jsonify, request

from .models import User, Note

notes = Blueprint('notes', __name__, url_prefix='/notes')


@notes.route('/', methods=['POST'])
def create_note():
    data = request.json()
    note = Note(
        _id=data['_id'],
        creation_time=data['creation_time'],
        location=data['location'],
        title=data['title'],
        body=data['body'],
    ).save()
    return jsonify(note.to_dict())


@notes.route('/<note_id>', methods=['GET'])
def get_note(note_id):
    return jsonify(Note.objects(id=note_id).first().to_dict())


@notes.route('/', methods=['GET'])
def get_notes():
    return jsonify(Note.objects())


@notes.route('/<note_id>', methods=['DELETE'])
def delete_note(note_id):
    Note.objects(id=note_id).delete()
    return


@notes.route('/nearby', methods=['GET'])
def get_nearby_notes():
    # first number is latitude, second is longitude
    coordinates = request.json()['coordinates']
    nearby_notes = []
    for note in Note.objects():
        if note.is_near(coordinates):
            nearby_notes.append(note)
    return jsonify(nearby_notes)
