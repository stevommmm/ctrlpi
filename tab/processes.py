import os

def fetch(**kwargs):
	import subprocess, re
	p = subprocess.Popen(['ps', '-ef'], stdout=subprocess.PIPE)
	out, err = p.communicate()
	split = lambda x:re.split('\s+',x, 7)
	pr = map(split, out.splitlines())
	dr = lambda x: '<tr><td>%s</td><td>%s</td><td>%s</td></tr>' % (x[0], x[1], x[-1])
	
	return """<table>%s</table>""" % "\n".join(map(dr, pr))