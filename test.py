import requests

response = requests.post("http://localhost:5000/notes", json={
    "creation_time": 123456789,
    "coordinates": [123.456, 123.456],
    "title": "title",
    "body": "body",
})

print(response)
