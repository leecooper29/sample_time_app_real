from datetime import datetime
from zoneinfo import ZoneInfo
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Sample Time App is up and running!"

@app.route("/time")
def get_time():
    current_time = datetime.now(ZoneInfo("America/New_York")).strftime("%I:%M:%S %p")
    return f"Current Time: {current_time}\n"

app.run(host='0.0.0.0',
        port=8080,
        debug=True)
