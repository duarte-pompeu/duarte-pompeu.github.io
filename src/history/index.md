# History of this website

## 2015

Back in 2015, I was studying Software Engineering and I thought it'd be 
cool to have a blog - didn't have much to say, but it would be cool!
It was plain HTML, as I didn't know any better.
No posts yet, but I linked to some silly webapps I made:

-  a name generator which would insult you
- a proverb generator which would mix two halfs of proverbs to create a new one

Funny because random: peak humor! Surely they would showcase my amazing technical skills and help me land a nice job!

(Those silly projects are currently down but I should try to recover them.)

Then a friend told me about site generators - that seemed better than plain HTML! I wrote some `.md` files and left the HTML to [Pelican](https://github.com/getpelican/pelican). 
Much better! 
`md` files in one folder, `html` in other: all of them sent to git and GitHub Pages (it was cheap and I didn't even know about `.gitignore`.)

This was fine for a few years, as I kind of abandoned the website before starting it proper... 

When I remembered about something to add, I reinstalled everything, generated it again and alas: it was broken.

This would be a repeating theme.

## 2018

According to my commits, I tried to move to [hexo](https://hexo.io/), but I hardly remember it. Next.

Then I had the brilliant idea to create my own website generator:
that would surely be simpler! No pesky developers updating their generators and causing my website to break! So I created a [bash script](https://github.com/duarte-pompeu/duarte-pompeu.github.io/blob/master/build.sh) using [pandoc](https://pandoc.org) 
inspired by [this](http://wstyler.ucsd.edu/posts/pandoc_website.html). I run `build.sh` and it converts the `.md` files from `src/` to `html` files in `web` (which is still under source control, because why break the tradition?).

Guess what - updates in `pandoc` and `.css` files hosted in other websites caused it to break.

But also guess what? 
Fixing the `css` only took a quick hack and it still works, 5 years later! 
Praise `pandoc`, praise `bash`! 
Also praise this brilliant humble dev, who decided to prepend the `html` output with `_b.html`, and append it with `_a.html` (as in, before and after).
There wasn't a single time this confused me, I promise.

## 2020

In 2020 I finally included a blog post: a horrible hack to automate creating a playlist in Spotify using fucking *Autohotkey*. 
You just needed to install Autohotkey, hardcode your desiredconfiguration, and move your mouse to a specific spot for it to work - can you hear the cries of UX designers? 

(Not that the frontend devs today are doing much better: websites taking 20 seconds to load and middle button not opening new tabs for half of modern websites? Pretty lame.
Yes, I just compared this shit to modern frontend development, and I'm only half joking.)

I was now a *professional* backend developer, and thought this would
be a good idea to share with the world!
It's hidden now, but not deleted. As they say: if you're not ashamed about
your code years ago, you're doing it wrong; let it be a [reminder](blog/2020-07-11-auto_hotkey_spotify.html).

## 2022

Moved to netlify to see how it works... 
It's OK. 
I'm still building the html locally and versioning, so it just puts a web server in front of my files: not that interesting.

## 2023

It's 2023 now. I made a proper project to generate Spotify playlists: 
this time using a slightly more user-friendly approach. It's made with a python backend, FastAPI, jinja templates, ci/cd and even OAuth flow, which had confused the crap out of me when I read it in 2020. 

Progress: that's the good stuff. 

[Go try it!](https://discover-albums.duartepompeu.com) Now you know the intention behind this post: it's an ad, like everything in the internet.

## The future

So what now? I feel like I have more to say nowadays. Developing for 4 years already, I feel like  a greybeard of sorts: sharing wisdom, reminiscing about the past and full of disdain for the youth and new technologies.

So I might actually write some more posts. I just wrote this, so I guess it's a start.
