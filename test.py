import requests

for i in range(10):
    response = requests.post("http://localhost:5000/notes/", json={
        "creation_time": 123456789,
        "coordinates": [123.456, 123.456],
        "title": f"note {i}",
        "body": "body",
    })

print(response.text)
