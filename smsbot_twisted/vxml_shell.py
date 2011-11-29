import sys

from vxml import statemachine

def use_stdin(machine):
	if (machine.isReady()):
		line = sys.stdin.readline().strip()
	
		return machine.process(line)
	else:
		return False;
		
if (len(sys.argv) < 2):
	print(sys.argv[0] + ": Missing VoiceXML script argument.")
	print("usage: vxml_shell.py script")
	exit(-1)

script_machine = statemachine.parse_script(sys.argv[1])

while use_stdin(script_machine):
	pass
