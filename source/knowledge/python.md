# Cheatsheet for Python 3

~~~

#!/usr/bin/python3

def main():
    # read arguments (simple)
    import sys
    print(str(sys.argv))

    # read argument (argparse)
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--echo", default=None, help="example of an argparse argument")
    args = parser.parse_args()

    print(args.echo)

    # read from stdin

    import fileinput
    for line in fileinput.input():
        print(line)

    # read from file
    import fileinput
    file_name = None

    for line in fileinput.input(file_name):
        print(line)

    # random
    import random
    import datetime as dt

    seed = hash(dt.datetime.now())
    print("SEED: {}".format(seed))
    random.seed(seed)
    r = random.randint(0,5)

    # sleep
    import time

    n_secs = 5
    print("Sleeping for {} seconds.".format(str(r)))
    time.sleep(n_secs)

if __name__ == "__main__":
	main():

~~~
