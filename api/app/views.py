from flask import Blueprint, jsonify, request

from .models import User, Note

views = Blueprint('views', __name__)


@views.route('/notes/create', methods=['POST'])
def create_note():
    data = request.json()
    note = Note(
        creation_time=data['creation_time'],
        location=data['location'],
        title=data['title'],
        body=data['body'],
        owner=data['owner'],
        icon=data['icon']
    ).save()
    return jsonify(note.to_json())
