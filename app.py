from bottle import Bottle, run, template, static_file, request
app = Bottle()

import tab
plugins = tab.init_plugins()

@app.route('/')
def r_index():
	return template('index', tabs=plugins)

@app.route('/tab/<plugin>')
def r_plugin(plugin):
	if plugin in plugins:
		return str(plugins[plugin].fetch(**request.query))
	else:
		return "No such plugin"

@app.route('/static/<filename>')
def r_static(filename):
	return static_file(filename, root='static')

run(app, host='0.0.0.0', port=8080)
