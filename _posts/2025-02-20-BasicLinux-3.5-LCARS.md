---
layout: post
title: BasicLinux 3.5 LCARS LiveCD
date: 2025-02-20 01:19
category: 
author: 
tags: [DOS, retro, linux]
summary: A Linux LiveCD that runs on a 386 with 4MB RAM
---

A few weeks ago, the good people at [FreeGeek Chicago](freegeekchi.org) hooked me up with a really sweet "pizza box" 386, in a slick black livery with matching new-old-stock mechanical keyboard. This thing checked every box I could have for a 386 - a Turbo button, a front-panel CPU speed readout, a 40MHz DX CPU...it was a great deal. This thing is quite cool, except for its half-16-bit-half-8-bit riser card, which I am modifying to be fully 16-bit sockets. C'est la vie.

Naturally, I wanted to get to playing [my favorite game, `SETUP.EXE`](https://www.youtube.com/watch?v=w9X0hm5ZgJ0&pp=ygUabXkgZmF2b3RpcmUgZ2FtZSBzZXR1cC5leGU%3D). However, the hard disk in this machine was the original unit, complete with a corporate installation of Windows for Workgroups 3.11, and an assortment of professional programs, screensavers, and [for some reason] VGA demos that I wanted to preserve for later exploration. In the meantime, though, I was excited to have a vintage PC with an actually working hard drive for once, so I could install the pickiest OS of them all, OS/2. So I needed to be able to back up the HDD, so I could get to formatting the disk and playing `SETUP.EXE`.

## Harder than it looks

It turns out, imaging the full disk was a bit of a huge headache. I tried connecting an IDE2SD to the secondary channel of the IDE cable, but I could not get it to work. Of course the smallest SD card you can buy now is 4GB, which was the entire internet in those days, so this BIOS can't comprehend it on its own, and the C/H/S values I tested never amounted to anything.

The slimline "pizza box" design of the case was a big selling point for me, but it also means the interior is pretty cramped. Removing the HDD from the machine in order to image it externally was going to be a headache. More accurately, putting it back in the machine was going to be a huge headache, getting it out was only kind of a pain. On top of that, though, I don't have a native USB-IDE adapter, so I'd have had to patch it into another machine and image it there.

I got an Ethernet card working, and I tried FTP'ing all the files on the disk to my modern PC using MTCP, and while this mostly worked, I was getting dozens of unexpected errors, so my "backup" of the disk was only about 80% complete. Good enough, really, but I wasn't satisfied.

Eventually I got my AHA-1542CP SCSI card working, and discovered that it could boot CDs, and could read my BlueSCSI.

If only I had a Linux LiveCD that could run on a machine this old...

## A ray of hope

Enter [BasicLinux](https://distro.ibiblio.org/baslinux/), a 25-year-old project used for booting Linux on 35-year-old hardware. While I generally would have preferred to use something more modern, Linux support for *actual* i386 processors didn't actually last that long, despite the "i386" moniker sticking around for a long time. Any modern 32-bit Linux distro is likely to require a 486 or better, with many more only working on Pentium MMX or even Pentium III SSE chips. Almost more importantly, even a typical distro from 25 years ago - one that likely did actually support 386-class CPUs - would require more than the 8MB of RAM installed in this machine. This would absolutely be the case if you wanted to run a full desktop, but it was even possible you could have problems booting a LiveCD at all with that little RAM. Most "small" distros of the era like DamnSmall or Puppy expected to run from a read-write RAM disk, and 8MB just wouldn't cut it.

BasicLinux, though, was designed specifically for the worst-case 8MB 386 scenario in mind. In fact, it claims to run in just 3MB (with CDROM drivers, my LiveCD will boot in 3MB, and then crash for lack of memory when calling `ls`). Based on Slackware 4.0, "BL3" as its third version was known in shorthand, provided a tiny 2MB root filesystem image which could be transferred to an MS-DOS disk by floppy, and then booted from there. The root filesystem was just an ext2 image file, stored on the MS-DOS partition. The bootloader was a DOS program called "LOADLIN". The whole system could just live in a folder on your DOS disk, and you could fire it up as needed. There were a dozen or two "official" BasicLinux packages, and a full set of kernel modules to cover most common hardware of the era. On top of all that, the documentation indicated that "most" Slackware 4 packages would just work with the provided kernel.

I did actually install it this way, and used it to back up the HDD to the BlueSCSI. But it got me thinking...

## Getting carried away

If BasicLinux lived in an ext2 image file, and could be booted from any old MS-DOS environment, then it stood to reason that I could put all the files onto a bootable MS-DOS CD, and I'd have a BasicLinux LiveCD. I knew ImgBurn would let me create a bootable ISO image using a generic bootable floppy image, so I used a Windows 98 boot floppy (which had CD-ROM drivers) and put the BasicLinux boot files into the root of the CD. Things tried to boot, but as the BasicLinux kernel wasn't compiled with CD-ROM support built-in, it couldn't read its own root filesystem, and stalled out.

First I worked on a custom boot floppy image. I packed all the stock CD drivers, plus the USB drivers from [LCARS-DOS](https://github.com/queenkjuul/LCARS), and as many helpful utilities as I could fit. My goal was for the MS-DOS boot environment to be a useful recovery tool on its own.

Then, I had to figure out how to make a new `initrd` that would include CD-ROM drivers. The barebones 75KB busybox shell used in the stock `initrd` wasn't compiled to include `insmod`, so I had to compile a new BusyBox binary specifically to use with `initrd`. In retrospect I maybe could have pulled `insmod` from the Slackware 4 `modutils` package, but this way let me totally minimize the RAM usage. Getting the initrd working was actually a little easier than I expected (though still a pain), but before long I was able to boot the system from CD.

It turns out, though, that X won't run without being able to write to a lock file, which it can't do on a read-only CD filesystem. So I ended up rewriting `startx` entirely, using a 64KB ext2 RAM disk for `/tmp` so that X has a place to write lockfiles. I also kludged together a horrible disk-image-swapping method of changing the `/dev/mouse` symlink without writing to `/dev`.

Next, I expanded the root image to 100MB, and started installing packages. I quickly realized that 100MB would not be enough if I wanted to cram all of the "official" BasicLinux packages and modules, which I did. I also went through the Slackware 4.0 repo and installed a selection of those packages. Eventually, I settled on 300MB for the root filesystem (all but about 20MB of which is used), which leaves just enough space for the Slackware package repo, all Slackware 4 `contrib` packages (except for `xemacs`), the 2.2.26 kernel headers, Opera 7 binaries, and the original BasicLinux floppy images and documentation. It's not that I have something against `xemacs`, it's just that 60MB for one package wasn't worth it, and for compatibility's sake I wanted to keep this to a 650MB CD-R, not a 700MB.

Hours and hours of work later, I've rewritten the init script `/etc/rc` to read kernel command line arguments and automatically load certain drivers, I've settled on a solid set of applications providing a remarkably fully-featured desktop environment, I've written a second `initrd` which lets you load SCSI drivers from floppy disk at boot time, and I've played two games of Freecell within the LiveCD (where my loss stats won't be saved).

## It's a start

I'm pretty proud of what I have here, standing on the shoulders of giants and all. This is a complete Linux LiveCD desktop, running in 8MB of RAM on a 386DX. It's still a little hard to believe this is possible.

That said, there is more to be done. I've opened issues on Github for all of the work I'd like to someday incorporate into the project.

In the meantime, I am feeling fairly confident that I've got the project at a point where it's useful to me personally, which is all it really ever needed to do. I have a CD I can use to boot almost any of my retro PCs and back up files, partition disks, repair filesystems, and various other useful live-cd tasks. The big question mark is networking - BasicLinux boasted of its networking capabilities, but I've yet to test things out properly. This will likely lead to more Github issues, and more future releases.
