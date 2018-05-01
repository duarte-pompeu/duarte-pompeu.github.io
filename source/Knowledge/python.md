# Cheatsheet for Python 3
~~~
#!/usr/bin/python3

import time
import random
import sys
import fileinput
import argparse
import datetime as dt

def main():

    # read arguments (simple)
    print(str(sys.argv))


    # read argument (argparse)
    parser = argparse.ArgumentParser()
    parser.add_argument("--echo", default=None, help="example of an argparse argument")
    args = parser.parse_args()

    print(args.echo)


    # read from stdin
    for line in fileinput.input():
        print(line)

    # read from file
    file_name = None

    for line in fileinput.input(file_name):
        print(line)


    # random

    seed = hash(dt.datetime.now())
    print("SEED: {}".format(seed))
    random.seed(seed)
    r = random.randint(0,5)


    # sleep
    n_secs = 5
    print("Sleeping for {} seconds.".format(str(r)))
    time.sleep(n_secs)

if __name__ == "__main__":
	main()

~~~
