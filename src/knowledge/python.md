# Cheatsheet for Python 3
~~~python
#!/usr/bin/python3

def main():

    ######################################################################
    # argparse - https://docs.python.org/3/library/argparse.html
    ######################################################################
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--train", action="store_true", help="optional argument, stores a true/false value")
    parser.add_argument("-steps",type=int, help="optional argument, followed by a int value")
    parser.add_argument("-episodes", type=int, help="optional argument, followed by a int value")

    args = parser.parse_args()

    args_example = ["--train", "-episodes=5", "-steps", "6"]
    args = parser.parse_args(args_example)

    if args.train:
        print(args.steps, args.episodes) # prints (6, 5)



    print("(double EOF to skip)")
    ######################################################################
    # read from stdin
    ######################################################################
    import fileinput
    for line in fileinput.input():
        print(line)



    ######################################################################
    # read from file
    ######################################################################
    file_name = None
    for line in fileinput.input(file_name):
        print(line)



    ######################################################################
    # random
    ######################################################################
    import datetime, random, time
    import numpy as np

    seed = hash(datetime.datetime.now())
    random.seed(seed)
    # r = random.randint(1, 3)
    r = np.random.randint(1, 3)
    print("sleeping for {} seconds with seed={}".format(r,seed))
    time.sleep(r)



    ######################################################################
    # progressbar - https://pypi.org/project/progressbar2/
    ######################################################################
    import progressbar

    max_val = 10
    widgets=[
        progressbar.DynamicMessage("seed_val"),
        ' [', progressbar.Timer(), '] ',
        progressbar.Bar(),
        ' (', progressbar.ETA(), ') ',
    ]
    bar = progressbar.ProgressBar(max_value=max_val, widgets=widgets)
    for i in range(max_val):
            bar.update(i, seed_val=seed)
            time.sleep(1)



    ######################################################################
    # statistics - https://docs.scipy.org/doc/scipy/reference/stats.html
    ######################################################################
    import numpy as np
    import scipy.stats as stats
    np.random.seed(666)
    values = np.random.random((100,))*1000 + 1000 # 1000-2000

    mean = np.mean(values)
    percentiles = [25, 50, 75]
    scores = stats.scoreatpercentile(values, percentiles)
    print(mean)
    print(scores)




if __name__ == "__main__":
    main()

~~~
