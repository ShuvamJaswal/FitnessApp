import requests
from flask import Flask,request,jsonify,send_file
from data import all_exercises
from threading import Thread
app=Flask(__name__)
from workout_plans import plans
@app.route('/')
def root():
	return """<!DOCTYPE html>
<body>
    <a href="/get_all">/get_all</a>
	<br>
    <a href="/get_all_names">/get_all_names</a>
	<br>
    <a href="/all_body_part_names">/all_body_part_names</a>
	<br>
	<a href="/plan">/plans</a>
	<br>
    <a href="/all_target_names">/all_target_names</a>
	<br>
	<a href="/all_equipments">/all_equipment</a>
	<br>
    <a href="/search_by_name/bench press">/search_by_name/{name}</a>
	<br>
    <a href="/get_exercise_by_id/0001">/get_exercise_by_id/{id}</a>
	<br>
    <a href="/get_gif/0aKLKVbmAoH4Kh">/get_gif/{id}</a>
	<br>
    <a href="/get_by_target/triceps">/get_by_target/{target}</a>
	<br>
    <a href="/get_by_body_part/chest">/get_by_body_part/{body}</a>
</body>
</html>"""

EXERCISES={}
@app.route('/get_gif/<id>')
def get_image(id):
	filename = f'all_gifs/gifs/{id}.gif'
	return send_file(filename, mimetype='image/gif')

@app.route('/plan')
def get_plans():
	return """<!DOCTYPE html>
<body>
<a href="/plan/ALL">/plan/ALL</a>
	<br>
<a href="/plan/MG">/plan/MG</a>
	<br>
<a href="/plan/FL">/plan/FL</a>
	<br>
<a href="/plan/ST">/plan/ST</a>
	<br>
<a href="/plan/HW">/plan/HW</a>
	<br>
</body>
</html>"""
@app.route('/plan/<id>')
def get_plan(id):
	return jsonify(plans[id])
@app.route('/get_exercise/<level>/<goal>')
def get_exercise(level,goal):
	return jsonify(EXERCISES)
@app.route('/get_all')
def get_all():
	return jsonify(all_exercises)
@app.route('/all_body_part_names')
def all_body_part_names():
	return jsonify(list(set([i['bodyPart'] for i in all_exercises])))
@app.route('/all_equipments')
def all_equipments():
	return jsonify(list(set([i['equipment'] for i in all_exercises])))
@app.route('/all_target_names')
def all_target_names():
	return jsonify(list(set([i['target'] for i in all_exercises])))
@app.route('/get_all_names')
def get_all_names():
	return jsonify([i['name'] for i in all_exercises])
@app.route('/get_by_body_part/<part>')
def get_by_body_part(part):
	part=part.replace("%20",' ')
	return jsonify([i for i in all_exercises if i['bodyPart']==part])
@app.route('/get_by_target/<target>')
def get_by_target(target):
	target=target.replace("%20",' ')
	return jsonify([i for i in all_exercises if i['target']==target])
@app.route('/search_by_name/<name>')
def search_by_name(name):
	name=name.replace("%20",' ')
	return jsonify([i for i in all_exercises if name in  i['name']])
@app.route('/get_exercise_by_id/<id>')
def get_exercise_by_id(id):
	return jsonify([i for i in all_exercises if i['id']==id])

@app.route('/get_body_data/')
def get_body_data():
	age = request.args.get('age', default = '20', type = str)
	gender = request.args.get('gender', default = 'male', type = str)
	height = request.args.get('height', default = 130, type = int) 
	weight = request.args.get('weight', default = '80', type = str)
	activity ="level_"+ request.args.get('activity', default = 'level_2', type = str) 
	return jsonify(get_data(age=age,gender=gender,height=height,weight=weight,activity=activity))
def get_data(age,gender,height,weight,activity):
	data={}
	def bmi():
		bmi=make_api_call("https://fitness-calculator.p.rapidapi.com/bmi",{"age":age,"weight":weight,"height":height})
		data.update({'bmi':float(bmi['data']['bmi']),
				'bmi_low':float(bmi['data']['healthy_bmi_range'].split('-')[0][:-1]),
				'bmi_high': float(bmi['data']['healthy_bmi_range'].split('-')[1][1:])})
		macro_requirements()
	def calorie(): 
		calorie_requirement=make_api_call('https://fitness-calculator.p.rapidapi.com/dailycalorie', {"age":age,"gender":gender,"height":height,"weight":weight,"activitylevel":activity})
		data.update({
			'maintain_weight_calories':int(calorie_requirement['data']['goals']['maintain weight']),
			'lose_weight_calories':int(calorie_requirement['data']['goals']['maintain weight'])-500,
			'gain_weight_calories':int(calorie_requirement['data']['goals']['maintain weight'])+500
		}) 
	def ideal():
		ideal_weight=make_api_call('https://fitness-calculator.p.rapidapi.com/idealweight',{"gender":gender,"height":height})
		data.update({'ideal_weight':float(ideal_weight['data']['Devine'])})
	def macro_requirements():
		if data['bmi']<data['bmi_low']:
			goal='weightgain'
			val=2
		elif data['bmi']>data['bmi_high']:
			goal='weightlose'
			val=1
		else:
			goal='maintain'
			val=0
		macro=make_api_call('https://fitness-calculator.p.rapidapi.com/macrocalculator',  {
			'age': age,
			'gender': gender,
			'height': height,
			'weight': weight,
			'activitylevel': activity.split('_')[-1],
			'goal': goal
		},)
		data.update({
				"maintain_lose_gain":val,
				"fat":float(macro['data']['balanced']['fat']),
				"carbs":float(macro['data']['balanced']['carbs']),
				"protein":float(macro['data']['balanced']['protein']),
			   })
	a=Thread(target=bmi)
	a.start()
	b=Thread(target=calorie)
	b.start()
	c=Thread(target=ideal)
	c.start()
	a.join()
	b.join()
	c.join()
	return data
def make_api_call(url,querystring):
	headers = {
		"X-RapidAPI-Key": "<YOUR-API-KEY>",
		"X-RapidAPI-Host": "fitness-calculator.p.rapidapi.com"
	}
	response = requests.get(url, headers=headers, params=querystring)
	return response.json()
# app.run(debug=1)
