import requests

res = requests.post("http://localhost:5000/notes/", json={
    "coordinates": [1, 2],
    "title": "test",
    "body": "test"
})

print(res.json())
