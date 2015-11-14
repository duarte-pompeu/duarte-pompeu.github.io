Title: Knowledge references


#Splitting a media file in different parts with ffmpeg and ruby

	ruby -e '(0..4500).step(300) { |x| system "ffmpeg -ss #{x} -i in.m4a -c copy -t 300 out-#{x}.m4a"}'

[reference](http://superuser.com/questions/525210/splitting-an-audio-file-into-chunks-of-a-specified-length)

#Python - command line arguments

	import sys
	all_args = sys.argv
	args = sys.argv[1:]

[reference](http://www.tutorialspoint.com/python/python_command_line_arguments.htm)

#$ whereis

Not only does it tell you where the executable file is located at, but it will also locate the source, man page, and other associated directories as well.

[reference](https://chrisjean.com/4-great-tools-to-find-files-quickly-in-ubuntu/)
#Fish shell

List arguments

	$argv

[reference](http://duartepompeu.com/)
