import os

def fetch(**kwargs):
	return """Current load avg %s""" % os.getloadavg()[0]