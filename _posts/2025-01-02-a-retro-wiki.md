---
layout: post
title: A Retro-Accessible Wiki
date: 2025-01-02 06:04
author: qkj
categories: blog
excerpt: "Building a knolwedge base for retro computers"
---

I find myself spending inordinate amounts of time trawling through ancient forum posts and file archives hunting down obscure drivers, patches, registry hacks, installation instructions, and various other pieces of information related to getting ancient hardware and software working correctly. I think to myself, if only I could compile this information somewhere where it was easy to find, with direct downloads to the relevant software? Even better, what if it could be accessed directly from retro machines, so I could upload notes and files as I'm working on them? 

I considered using this site for this purpose, but there are a few issues. One, this site isn't super functional on retro browsers. It's not awful, but it's far from ideal. Additionally, I am annoying and self-host this site from a server in my house, and I don't want to deal with the headaches of setting up selective HTTP access to that machine. On top of that, this site gets deployed all-at-once, and I have a bad habit of leaving half-finished drafts of posts in the posts folder, further discouraging me from running a new deployment in the first place, so nothing ever gets updated.

## Requirements

What I needed, essentially, was a Wiki. A site that deploys once, that I can update in-situ, ideally from any platform, no matter how ancient. Preferably, something I can deploy with Docker, and that uses Markdown for syntax. I would need something that at least *functions* on ancient browsers, even if it looks ugly or is slightly broken. I would prioritize the editing and uploading experience on modern systems first, but I would consider it a requirement that the entire site be readable from old systems, and that basic text editing works on at least something as old as, say, IE6.

Originally I wanted to ensure compatibility all the way back to IE3, so that Windows 3.1 clients could reach the site. I found this [incredibly helpful guide from W3C themselves regarding IE3's buggy and incomplete CSS implementation](https://www.w3.org/Style/CSS/msie/), which gave me hope that I could follow the guidelines and get something working. However, after spending an unfortunate amount of time getting IE3 running in a VM, I've discovered that it is simply far too stupid and broken to be of any use, and given IE4 runs on Win16, I've decided to abandon IE3. 

So the goal is IE4+, which should mean Windows 3+ and at least Mac OS 8+. I hadn't really considered Netscape, as I tend to use IE on all my retro machines (unless I'm using something more modern, like iCab or Retrozilla or something) so this is probably going to continue to be my target.

## Weighing the options

I could, of course, write my own app from scratch. I could use SvelteKit to render pages server-side, and as long as I stick to simple old-school form submission, everything should work without too many issues. This has the advantage of giving me complete control over the application and how it works and how it looks, at the considerable expense of taking a huge amount of my time. To me, this mostly makes it a no-go. Part of the idea here is something that is simple to get up and running, so I can start saving files and notes before I forget about them and lose track of the original download locations.

I then tested out a few off-the-shelf modern Wiki solutions to see which ones would render in old browsers. Nothing worked with IE3, predictably, and most things didn't work on IE4 either. [DokuWiki](https://dokuwiki.org) worked great on IE5, but caused IE4 to completely crash. [Jingo](https://github.com/claudioc/jingo) worked pretty well, with the login, search, and edit features all working correctly on IE4, though the layout is somewhat broken. Still, it was promising, as it would let me have a somewhat-functional site up and running almost immediately. I also appreciate that the site content is kept as a Git repo, making it easy to mirror, and is kept entirely in native Markdown files.

## It's Forkin' Time

Jingo does a few things I do not like, though. The Toolbox is my first gripe. I do not enjoy the hidden-until-hover design choice, which of course breaks completely on old browsers. I further do not enjoy that this is hard-coded in the application, and not trivial to override with CSS. There's also some features I don't generally need to worry about. I also find it annoying that it is causing frequent, un-silence-able script errors on IE4, though this may simply be inevitable.

So I've decided to work on a fork of Jingo I'm tentatively calling jingo-basic, which strips out a lot of the styling and simplifies some of the features. I think it'd be cool if I could make the app easily theme-able in the process, but I'll settle for essentially converting it into an unstyled Wiki platform.

![Jingo on IE4 on WfW 3.11](/archive/wiki/jingo-ie4.png)