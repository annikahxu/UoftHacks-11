import requests

# for i in range(5):
#     # 43.6690119,-79.391594
#     requests.post("http://localhost:5001/notes/",
#                   json={
#                       "coordinates": [43.6690119, -79.391594 + 0.000001 * i],
#                       "title": f"note {i}",
#                       "body": "test note",
#                   })

coords = [43.6690119, -79.391594]

nearby_notes = requests.get("http://localhost:5001/notes/nearby", json={
    "coordinates": coords
}, verify=False)

#print(nearby_notes.text)
#print(nearby_notes.content)
#print(nearby_notes.headers)
print(nearby_notes.json())
