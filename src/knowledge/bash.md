# Bash template with examples

~~~
set -x #echo on
echo $0 # print args, use $1, $2 for 1st, 2nd, etc.


IFS=$'\n'
for word in $(echo -e "a\nb\nc"); do
	echo $word
done


for value in {10..0..2}; do
	echo $value
done

for value in $(seq 0 2 10); do
	echo $value
done

~~~


## Further reading

- https://wstyler.ucsd.edu/unix/