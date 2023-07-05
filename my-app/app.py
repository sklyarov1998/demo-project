from flask import Flask
app = Flask(__name__)

@app.route("/")
def health_check():
    return "Healthy!"

@app.route('/<random_string>')
def returnBackwardsString(random_string):
    return "".join(reversed(random_string))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000)
