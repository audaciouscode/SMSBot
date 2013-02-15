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
