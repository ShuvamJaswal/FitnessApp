from flask import Flask,request,jsonify
app=Flask(__name__)
@app.route('/')
def root():
	return 'Working'

EXERCISES={}


@app.route('/get_exercise/<level>/<goal>')
def get_exercise(level,goal):
	return jsonify(EXERCISES)