#!/usr/bin/python3

import argparse
import os
import fileinput
import re

ARG_INPUT = "input"
ARG_OUT_FOLDER = "output_folder"

MD_CODE = "md-code"

def main():
	# 0 parse args
	parser = argparse.ArgumentParser()
	parser.add_argument(ARG_INPUT)
	parser.add_argument(ARG_OUT_FOLDER)
	args = parser.parse_args()
	
	# 1 create folders if needed
	# TODO
	
	# 2 parse markdown
	
	# ~ for line in fileinput.input(args.input):
	text = ""
	for line in open(args.input, "r"):
		text += line
	
	# 3 markdown to html
	out = md_to_html_state_machine(text)
	
	# 4 print to file
	out_folder = os.path.relpath(args.output_folder, "./")
	tmp, file_name = os.path.splitdrive(args.input)
	out_path = out_folder + "/" + file_name.replace(".md", ".html")
	out_dir , tmp = os.path.splitdrive(out_path)
	
	print(out_folder)
	print(out_path)
	# cp -r source/* blog/
	
	f = open(out_path, "w+")
	print(out, file=f)

def md_to_html_state_machine(text):
	out = ""
	char = None
	
	while(text):
		# ~ print("stm")
		char = text[0]
		
		if char == "\\":
			out += text[1]
			text = text[1:]
		
		elif char == "~":
			if text[0:2] == "~~":
				current_out, text = code(text[2:])
				out+= current_out
			
			else:
				# ~ out += char
				text = text[1:]
				
		
		if char == "#":
			current_out, text = heading_1(text[1:])
			out += current_out
		
		else:
			out += char
			text = text[1:]
	
	return out

def heading_1(text):
	heading_index = 1
	off = 0
	
	for i in range(5):
		if text[i] == "#":
			off += 1
	
	heading_index += off
	text = text[off:]
	
	out = "<h{}>".format(heading_index)
	while(text):
		char = text[0]
	
		if char == "\n":
			out += "</h{}>\n\n".format(heading_index)
			return out, text[1:]
		
		else:
			out += char
			text = text[1:]

def code(text):
	out = "<p class=\"{}\" style=\"font-family:monospace; font-size: 12px;\"> <pre><code>".format(MD_CODE)
	char = None
	
	while (text):
		# ~ print("~code")
		char = text[0]
		
		if char == "\\":
			out += char
			text = text[1:]
			
		elif char == "~":
			if text[0:2] == "~~":
				text = text[2:]
				out += "</code></pre></p>\n\n"
				return out, text
			
			else:
				# ~ out += char
				text = text[1:]
			
		else:
			out += char
			text = text[1:]
	
	return out, None
	
			
if __name__ == "__main__":
	main()

