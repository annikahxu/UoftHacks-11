import requests

response = requests.get('http://localhost:5000/notes/')

print(response.text)
