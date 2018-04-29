---
title: Useful Knowledge
---

## Shell Scripting / CLI commands


### fish shell - List arguments

	$argv

### Splitting a media file in different parts with ffmpeg and ruby

	ruby -e '(0..4500).step(300) { |x| system "ffmpeg -ss #{x} -i in.m4a -c copy -t 300 out-#{x}.m4a"}'
	
[reference](http://superuser.com/questions/525210/splitting-an-audio-file-into-chunks-of-a-specified-length)
	
### Learn more about a command
	
	$ whereis [command]		# locate the binary, source, and manual page files for a [command]
	$ whatis [command]		# display one-line manual page descriptions
	$ which [command]		# shows the full path of (shell) commands.
	$ apropos [command]		# search the manual page names and descriptions
	
	# the classics:
	
	$ man [command]			# an interface to the on-line reference manuals
	$ info [command]		# read Info documents

[reference](https://chrisjean.com/4-great-tools-to-find-files-quickly-in-ubuntu/)

### Python - command line arguments

	import sys
	all_args = sys.argv
	args = sys.argv[1:]

[reference](http://www.tutorialspoint.com/python/python_command_line_arguments.htm)

