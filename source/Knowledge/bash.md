# Bash template with examples

~~~
set -x #echo on
echo $0 # print args, use $1, $2 for 1st, 2nd, etc.


IFS=$'\n'
for word in $(echo -e "a\nb\nc"); do
	echo $word
done

~~~


