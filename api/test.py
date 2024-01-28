import requests

# for i in range(5):
#     # 43.6690119,-79.391594
#     requests.post("http://localhost:5000/notes/",
#                   json={
#                       "coordinates": [43.6690119, -79.391594 + 0.000001 * i],
#                       "title": f"note {i}",
#                       "body": "test note",
#                   })

coords = [43.6690119, -79.391594]

nearby_notes = requests.get("http://localhost:5000/notes/nearby", json={
    "coordinates": coords
})

print(nearby_notes.json())
