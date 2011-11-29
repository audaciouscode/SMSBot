from xml.dom import minidom
from xml.dom.minidom import Node

import string
from backend import site

from nodes import *

def parseBlock(block):
	return PrintNode(block.firstChild.nodeValue.strip())

def setVariableNames(xml_doc, name):
	for field_element in xml_doc.getElementsByTagName(u"field"):
		variable = field_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"variable")
		
		if (variable != u""):
			field_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", u"variable" , name + u":" + variable)

def parseSend(element):
	dest = element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"dest")
	message = element.firstChild.nodeValue.strip()
	
	return SendMessageNode(message, dest)

def parseSendVariable(element, start_node):
	dest = element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"dest")
	variable = element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"variable")
	
	return SendVariableNode(variable, dest, start_node)

def parseField(field):
	root_node = None
	node = None

	prompt_node = None

	recognize = []

	for field_node in field.childNodes:
		if (field_node.nodeType == Node.ELEMENT_NODE):
			if (field_node.nodeName == u"grammar"):
				grammar_string = unicode(field_node.firstChild.nodeValue).strip().lower()

				tokens = string.split(grammar_string, u"|")
				for token in tokens:
					if (token != u""):
						recognize.append(token.strip())

	for field_node in field.childNodes:
		if (field_node.nodeType == Node.ELEMENT_NODE):
			if (field_node.nodeName == u"prompt"):
				variable = field.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"variable")
				
#				prompt_node = PromptNode(field_node.firstChild.nodeValue.strip(), field.getAttribute(u"name"), variable, recognize)
				prompt_node = PromptNode(unicode(field_node.firstChild.nodeValue).strip(), field.getAttribute(u"name"), variable, recognize)
				
				if (root_node is None):
					root_node = prompt_node
		
				if (node is not None):
					node.insertNode(prompt_node)
			
				node = prompt_node
			elif (field_node.nodeName == u"filled"):
				if_elements = field_node.getElementsByTagName(u"if")
		
				if (len(if_elements) > 0):
					if_element = if_elements[0]
			
					true_actions = []
					false_actions = []
			
					found_else = False
			
					for element_node in if_element.childNodes:
						if (element_node.nodeType == Node.ELEMENT_NODE):
							if (element_node.nodeName == u"else"):
								found_else = True
							else:
								action_node = None
						
								if (element_node.nodeName == u"block"):
									action_node = parseBlock(element_node)
								elif (element_node.nodeName == u"field"):
									action_node = parseField(element_node)
								elif (element_node.tagName == u"smsbot:send"):
									action_node = parseSend(element_node)
								elif (element_node.tagName == u"smsbot:send_variable"):
									action_node = parseSendVariable(element_node, root_node)

								if (found_else and action_node is not None):
									false_actions.append(action_node)
								else:
									true_actions.append(action_node)
							
					conditional_node = ConditionalNode(prompt_node, if_element.getAttribute(u"cond"), true_actions, false_actions)

					if (root_node is None):
						root_node = conditional_node
		
					if (node is not None):
						node.insertNode(conditional_node)
				else:
					filled_node = PrintNode(field_node.firstChild.nodeValue.strip())
		
					if (root_node is None):
						root_node = filled_node
		
					if (node is not None):
						node.insertNode(filled_node)
			
					node = filled_node

	return root_node		

def parseForm(form):
	root_node = None
	node = None

	for childNode in form.childNodes:
		if (childNode.nodeType == Node.ELEMENT_NODE):
			if (childNode.nodeName == u"block"):
				block_node = parseBlock(childNode)

				if (root_node is None):
					root_node = block_node
		
				if (node is not None):
					node.appendNode(block_node)
			
				node = block_node

			if (childNode.nodeName == u"field"):
				field_node = parseField(childNode)
		
				if (root_node is None):
					root_node = field_node
		
				if (node is not None):
					node.appendNode(field_node)
			
				node = field_node

#	if (root_node is not None):
#		root_node.appendNode(PrintResultsNode(root_node))
		
	return root_node		

def parseElement(element):
	if (element.nodeName == u"form"):
		return parseForm(element)
	elif (element.nodeName == u"filled"):
		return PrintNode(element.firstChild.nodeValue.strip())
	else:
		node = None
	
		for child in element.childNodes:
			if (child.nodeType == Node.ELEMENT_NODE):
				child_node = parseElement(child)
				
				if (node is not None and child_node is not None):
					node.insertNode(child_node)
				elif (child_node is not None):
					node = child_node;
					
		return node;

def parse(script):
	document = minidom.parseString(script)
	
	node = parseElement(document.documentElement)
	return node, node.initialCommands()
	
def makeTip(first_msg, second_msg, third_msg, name=u"Anonymous Tip"):
	tip_doc = minidom.parse(u"templates/tip.vxml")
	setVariableNames(tip_doc, name)
	
	for element in tip_doc.getElementsByTagName(u"field"):
		message = element.getAttributeNodeNS(u"http://www.audacious-software.com/smsbot", u"message")

		for prompt in element.getElementsByTagName(u"prompt"):
			if (message.value == u"first"):
				first_text = tip_doc.createTextNode(first_msg)
				prompt.appendChild(first_text)

			elif (message.value == u"second"):
				second_text = tip_doc.createTextNode(second_msg)
				prompt.appendChild(second_text)

	for element in tip_doc.getElementsByTagName(u"block"):
		message = element.getAttributeNodeNS(u"http://www.audacious-software.com/smsbot", u"message")

		if (message.value == u"third"):
			third_text = tip_doc.createTextNode(third_msg)
			element.appendChild(third_text)

	return tip_doc.toxml()
	
def makeBroadcast(message):
	broadcast_doc = minidom.parse(u"templates/broadcast.vxml")

	for element in broadcast_doc.getElementsByTagName(u"block"):
		element.appendChild(broadcast_doc.createTextNode(message))

	return broadcast_doc.toxml()
	
def makePrompt(first_msg, second_msg, name=u"Anonymous Prompt"):
	prompt_doc = minidom.parse(u"templates/prompt.vxml")

	setVariableNames(prompt_doc, name)

	for element in prompt_doc.getElementsByTagName(u"field"):
		message = element.getAttributeNodeNS(u"http://www.audacious-software.com/smsbot", u"message")

		for prompt in element.getElementsByTagName(u"prompt"):
			if (unicode(message.value) == u"first"):
				first_text = prompt_doc.createTextNode(first_msg)
				prompt.appendChild(first_text)

	for element in prompt_doc.getElementsByTagName(u"block"):
		message = element.getAttributeNodeNS(u"http://www.audacious-software.com/smsbot", u"message")

		if (unicode(message.value) == u"second"):
			first_text = prompt_doc.createTextNode(second_msg)
			element.appendChild(first_text)

	return prompt_doc.toxml()

def makeFollowup(question, positive, negative, name=u"Anonymous Followup"):
	followup_doc = minidom.parse(u"templates/followup.vxml")

	setVariableNames(followup_doc, name)

	for form_element in followup_doc.getElementsByTagName(u"form"):
		for form_child in form_element.childNodes:
			if (form_child.nodeType == Node.ELEMENT_NODE):
				if (form_child.nodeName == u"field"):
					message = form_child.getAttributeNodeNS(u"http://www.audacious-software.com/smsbot", u"message")

					for field_child in form_child.childNodes:
						if (field_child.nodeType == Node.ELEMENT_NODE):
							if (field_child.nodeName == u"prompt"):
								if (message.value == u"one"):
									first_text = followup_doc.createTextNode(question)
									field_child.appendChild(first_text)

							elif (field_child.nodeName == u"filled"):
								for field_element in field_child.getElementsByTagName(u"field"):
									for prompt_element in field_element.getElementsByTagName(u"prompt"):
										first_text = followup_doc.createTextNode(positive)
										prompt_element.appendChild(first_text)

								for block_element in field_child.getElementsByTagName(u"block"):
									first_text = followup_doc.createTextNode(negative)
									block_element.appendChild(first_text)

	return followup_doc.toxml()

# def makeReminder(question, recipient, name="Anonymous Reminder"):
def makeReminder(recipient, name=u"Anonymous Reminder", spanish=False):
	reminder_doc = minidom.parse(u"templates/reminder.vxml")

	if (spanish):
		reminder_doc = minidom.parse(u"templates/reminder-spanish.vxml")
		
	part_dict = site.persistence.fetchParticipant(recipient)

	visitor_number = part_dict[u"visitor_mobile"]
	parent = part_dict[u"parent_name"]

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", u"dest", visitor_number)
		
		if (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"message") == u"yes"):
			first_text = reminder_doc.createTextNode(parent + u" has confirmed that they can still meet with you tomorrow.")
			send_element.appendChild(first_text)
		elif (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", "message") == u"no"):
			first_text = reminder_doc.createTextNode(parent + u" will not be able to meet with you tomorrow.")
			send_element.appendChild(first_text)

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send_variable"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", "dest", visitor_number)

	return reminder_doc.toxml()

def makeTomorrowReminder(recipient, name=u"Anonymous Reminder", time="00:00"):
	reminder_doc = minidom.parse(u"templates/reminder-src.vxml")

	part_dict = site.persistence.fetchParticipant(recipient)

	visitor_number = part_dict[u"visitor_mobile"]
	parent = part_dict[u"parent_name"]
	visitor = part_dict[u"visitor_name"]

	for prompt_element in reminder_doc.getElementsByTagName(u"prompt"):
		first_text = reminder_doc.createTextNode(u"You have an appointment with " + visitor  +  u" tomorrow at " + time + u" REPLY 1 TO CONFIRM, OR 2 TO RESCHEDULE")

		if (part_dict[u"spanish"]):
			first_text = reminder_doc.createTextNode(u"You tiene usted una cita con " + visitor + u" manana a las " + time + u" MARQUE 1 PARA CONFIRMAR, O 2 PARA CAMBIAR LA CITA")
	
		prompt_element.appendChild(first_text)

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", u"dest", visitor_number)
		
		if (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"message") == u"yes"):
			first_text = reminder_doc.createTextNode(parent + u" has confirmed that they can still meet with you tomorrow at " + time + u".")
			send_element.appendChild(first_text)
		elif (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", "message") == u"no"):
			first_text = reminder_doc.createTextNode(parent + u" will not be able to meet with you tomorrow at " + time + u".")
			send_element.appendChild(first_text)

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send_variable"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", "dest", visitor_number)

	return reminder_doc.toxml()

def makeTodayReminder(recipient, name=u"Anonymous Reminder", time="00:00"):
	reminder_doc = minidom.parse(u"templates/reminder-src.vxml")

	part_dict = site.persistence.fetchParticipant(recipient)

	visitor_number = part_dict[u"visitor_mobile"]
	parent = part_dict[u"parent_name"]
	visitor = part_dict[u"visitor_name"]

	for prompt_element in reminder_doc.getElementsByTagName(u"prompt"):
		first_text = reminder_doc.createTextNode(visitor  +  u" will be arriving for your appointment in approximately 2 hours REPLY 1 TO CONFIRM, OR 2 TO RESCHEDULE")

		if (part_dict[u"spanish"]):
			first_text = reminder_doc.createTextNode(visitor + u" llegara usted en aproximadamente 2 horas? MARQUE 1 PARA CONFIRMAR, O 2 PARA CAMBIAN LA CITA.")
	
		prompt_element.appendChild(first_text)

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", u"dest", visitor_number)
		
		if (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", u"message") == u"yes"):
			first_text = reminder_doc.createTextNode(parent + u" has confirmed that they can still meet with you today at " + time + u".")
			send_element.appendChild(first_text)
		elif (send_element.getAttributeNS(u"http://www.audacious-software.com/smsbot", "message") == u"no"):
			first_text = reminder_doc.createTextNode(parent + u" will not be able to meet with you today at " + time + u".")
			send_element.appendChild(first_text)

	for send_element in reminder_doc.getElementsByTagNameNS(u"http://www.audacious-software.com/smsbot", u"send_variable"):
		send_element.setAttributeNS(u"http://www.audacious-software.com/smsbot", "dest", visitor_number)

	return reminder_doc.toxml()
