import os
import sys

class Plugin(object):
	def fetch(self):
		return "No Content?"

def init_plugins():
	plugins = {}
	plugin_dir = os.path.dirname(os.path.realpath(__file__))
	plugin_files = [x[:-3] for x in os.listdir(plugin_dir) if x.endswith(".py") and x != '__init__.py']
	sys.path.insert(0, plugin_dir)
	for plugin in plugin_files:
		mod = __import__(plugin)
		plugins[mod.__name__] = mod
	return plugins
	