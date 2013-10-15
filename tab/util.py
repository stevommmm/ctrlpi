import os

def fetch(**kwargs):
	if 'shutdown' in kwargs:
		return os.system("sudo shutdown -r now")
	else:
		return """<center><button onClick="fetch('/tab/util?shutdown=now')">Shutdown</button></center>"""