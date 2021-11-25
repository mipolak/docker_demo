import os
import sys
from flask import Flask

app = Flask(__name__)


@app.route("/")
def index():
    return "Hello World and others!"

if __name__ == '__main__':
    try:
        index()
    except Exception as err:
        print('Something went wrong.', err)
        sys.exit(1)


