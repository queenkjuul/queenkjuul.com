---
layout: post
title: Adelie Linux on Apple G4 Laptops
tags: guides linux ppc ibook
---

A guide the the quirks and challenges of getting a modern Linux distro on vintage Apple laptops

## the actual part

I hate video tutorials. Hate hate hate them. Hard to follow along, I can read faster than you can talk, it's hard to precisely repeat a single line, and even with chapter markers, you can't jump to a specific word or phrase easily and consistently. So, I'm writing this up as a companion to Action Retro's awesome Adelie video, which I dutifully watched when it was new, forgot all about, and spent two days trying and failing to run Adelie on my new G4s instead of watching it again.

### First Boot

Most guides imply that to boot a Linux USB drive from OpenFirmware, you should try and use `yaboot` - however Adelie does not use Yaboot. However it actually boots with the same commands as a real Mac OS USB drive, so you can follow any of those guides online, or keep reading. 

Make your install USB stick like normal (which, for me on Linux is something like `dd if=adelie.iso of=/dev/sda bs=4M status=progress` BUT CHECK YOUR DISK DEVICE IS CORRECT WITH `lsblk` OR GOOGLE HOW TO DO THIS NOT MY FAULT IF YOU NUKE YOUR LAPTOP). Make sure your iBook is powered off, and insert the USB. Then boot holding `Command-Option-O-F` to get into the OpenFirmware prompt. 

to locate your drive, run `dev usb0` then hit enter, then run `ls`. If you get `ok` with no other results, proceed to try `dev usb` and `ls` again. What you want is a result which includes something like `disk@1` or `disk@0`.

When you've found the right path, run this:

`boot usb0/disk@1:,\\:tbxi`

Replace `usb0` and `disk@1` with the results you found above.

Et voila. Should boot right up into GRUB. It might be slow, and give an error about `unknown number` or something similar - just be patient, usually works within ~15s for me.

After it's installed the HDD, you would run `boot hd:X,\grub\grub` replacing X with the number of your bootstrap partition. See below.

***For the record, I have never successfully installed Adelie from USB on my iBook G4***

### `sudo`

Adelie live for some reason isn't big on letting you use `sudo` from the live environment. You can however use `su` to gain a root shell. Reminder the password for both the root and live user is `live`.

Also annoying, unlike most distros Adelie straight up hides root-required commands from normal users. So if you run `apk` as a normal user, you don't get "You need to be root" or some such error - you get `file not found`. `which apk` returns no results. So don't freak out like I did and assume your install is broken, you just need to `su`

### Launching the installer

The Adelie website makes reference to installing via CLI, but doesn't actually explain how. Not only this, I couldn't figure out how to launch the GUI installer from the CLI. This will be necessary, as the installer should be run as root but isn't because we can't `sudo`. So to launch it from your `su` shell, run `horizon-ui`.

### Partitioning

Even if you use the XFCE or MATE versions of Adelie, it will ship with KDE Partition Manager instead of GParted (which appears to be unavailable entirely on Adelie). This program will likely fail to work for you at all on an old Mac. It fails to do much of anything for me.

If you plan to dual boot, you will need OS X to already be installed. You should use Disk Utility to set the size of your OS X partition before installing. You can leave the rest of the disk as free space for now. If you don't plan to dual boot OS X, you should still use an OS X install CD to partition your disk, as the disk needs to have an Apple Partition Map format and the hidden partitions that Disk Utility creates.

To proceed, we'll have to use the command line. Get yourself a root shell with `su`, and run `mac-fdisk /dev/sda` (if you aren't sure if `/dev/sda` refers to your hard drive, double check with `lsblk` first). This will drop you into the `mac-fdisk` prompt. First things first, type `p` and hit enter to list the current state of the partition table.

This gets a bit confusing, because Apple makes questionable technical design decisions, and lists each gap of free space between partitions as its own partition with its own number. They also will only allow the machine to boot from specific types of partitions of particular sizes. Even manually using OpenFirmware commands I've had no luck getting around this.

`help` will list the commands, which are fairly straightforward.

<!-- TODO: Screenshot/output, detailed partition creation instructions -->

[this link has more detailed instructions](http://seb.france.free.fr/linux/ibookG4/iBookG4-howto.html#toc2.3)
[mirror](https://archive.queenkjuul.com/ibook-ppc/seb.france.free.fr/linux/ibookG4/iBookG4-howto.html#toc2.3)

After each command, run `p` again to print the latest partition table - you'll want access to the information there, and you'll want it to be up to date after each command.

When you create a partition, the first sector should be the `base` value of the bottom-most `Apple_Free` partition in the list. Printing the table between commands ensures the on-screen value for this free space block is up to date when you create the next partition.

You will need a _precisely_ `100M` sized partition of type `Apple_Bootstrap` (so use `C` to create it in `mac-fdisk`) which has the name `boot`. Then you'll need a root partition of at least `10G` in size, created as a Linux partition (so use `c` to create it), you can name it whatever. I left enough space at the end for a 1G swap partition, which I created as standard Linux partition, and will handle later on (don't forget to actually use `mkswap` on it later and add it to fstab, not covered in this guide).

Make note of the partition numbers you've created. You'll need them later (and they might not be intutive - i screwed one up because in my head, the root partition was "the last one" but the last partition was actually the 700KB of free space at the end of the disk that Apple assigns a partition number).

When our table looks good, we run `w` to write it to disk, then `q` to quit. Then launch the installer - you shouldn't necessarily need to run it from the shell as root, but I don' think it hurts, either. For the record, my partition table was something like

```log
/dev/sda1   Apple Partition Map
/dev/sda2   Free Space
/dev/sda3   OS X
/dev/sda4   boot
/dev/sda5   Linux
/dev/sda6   Swap
/dev/sda7   Free Space
```

### The Installer

The graphical installer is actually very straightforward and user friendly. It just doesn't actually work correctly for us. I'm not sure if it's necessary, but you can run the installer from the terminal via the `horizon-ui` command, which you can run as root if needed. You shouldn't need much help, except here is some guidance:

- You need an internet connection, and AirPort won't work, so use Ethernet
- Say Yes to installing firmware
- at Select Partition Types, choose "Use Existing Partitions"
- On the Add Mount Points screen:
  - Select your boot partition (for me, /dev/sda4)
    - Make sure to assign its mount point as `/boot` down below
    - Check the "Format" box
    - Set filesystem to HFS+
    - Confirm
  - Select your Root partition
    - Assign the mount point as `/`
    - Check the "Format" box
    - set Filesystem to `ext4` or `ext3` (I'm using the outdated ext3 in hopes of finding an OS X driver for it)
    - Confirm
- When asked, choose "Install Bootloader"
- I chose the minimal install to save time, as the first 3 times I tried a full install, it failed at the last possible second, wasting nearly an hour each time
- At one point, I was getting errors saying `firefox-esr` package could not be found in the repos - a custom install which omits Firefox got around this, however it really does appear that Firefox is missing from the repo. Big disappointment there, not gonna lie.

### Booting

So if all went to plan, the machine will still only boot into OS X, even if you hold Option at boot. You'll have to go into OpenFirmware to manually boot Grub. This is extra annoying. I swear my iBook G3 can boot Debian without needing to do this, so I'll be investigating.

To get into OpenFirmware, use Command+Option+O+F when booting. Once in the OpenFirmware shell, run one of these:

- To permanently boot Linux (unless you manually Option+boot and choose Mac OS): `setenv boot-device hd:XX,\grub\grub` where `XX` is the partition number of your `/boot` partition (so for me, it's 4 for `/dev/sda4`)
- To boot grub manually just once, run `boot hd:XX,\grub\grub` where `XX` is the partition number of your `/boot` partition (so for me it's 4 for `/dev/sda4`)

### Quirks

1. Adelie does not ship with `sudo`. You gotta `su` for root access (from which, you can install `sudo`, remember to set it up with `visudo`)
2. In the Custom installation mode, choosing `bash` over `dash` will cause `sddm` (the graphical login manager) to break, so, bad idea probably
3. Installing any of the KDE applications in Custom mode will install the entire KDE desktop as well, and set KDE as the default (even if you chose a different one in the Desktop Environments section)
4. You can install XFCE or MATE but the desktop applications will still be KDE applications. Kind of a shame, as XFCE and MATE are extremely well suited to iBooks in my opinion, but the extra overhead of Qt and GTK might not be worth it. Depends on your usage obviously, but you might lean towards LXQT with this particular distro on these particular machines.
5. LCD brightness keys work, but if you go up past the highest brightness, it overflows and the screen goes blank. Try reducing the brightness til it comes back, but I've gotten stuck and had to reboot (luckily, rebooting resets the brightness)
6. Suspend doesn't seem to work

### Right-click

iBooks and PowerBooks only have one mouse button, and single-touch trackpads. You can enable right- and middle-click emulation via keyboard buttons like so:

```sh
sudo nano /etc/sysctl.conf
```

and then adding the lines:

```txt
dev/mac_hid/mouse_button_emulation = 1
dev/mac_hid/mouse_button2_keycode = 97
dev/mac_hid/mouse_button3_keycode = 100
```

This maps `Fn+Ctrl` and `Fn+Opt` to right and middle, respectively. 

you can use `showkeys` to find keycodes, need to run as root on Adelie.

## The annoying life story before the recipe part

*which I've very nicely put at the end instead of the beginning*

I have a weird love-hate relationship with Apple. I have to use an M2 MBP for work, and while the form factor and battery life are nice, I prefer my Asus X13 to it in basically every way. macOS and I do not get along, and we haven't for a long time. I feel like there are lots of things missing from macOS that I have trained myself to be reliant on in the operating systems I usually use, like window snapping and keyboard window arrangement, robust GUI file management (Finder is seriously awful), three-finger multitouch middle clicking, and other various small-ish UIUX features, but there's a lot of weird and annoying things with Apple's security, diagnostic, and configuration systems that drive me nuts as well. In the end, short of a couple genuinely nice features, and the robust build quality, _I absofuckinglutely despise the things._

It's probably surprising, then, that I now own FIVE vintage Mac computers. Yep, five. I have a problem. See growing up I had a Mac Color Classic, and I came of age when the iPod and Apple's Aqua UI were the epitome of high-tech design. Even back then, though, OS X's quirks left me frustrated, and as a young adult Apple's price tags meant that I never actually owned a single apple device newer than a 1999 iBook until I bought an iMac G3 DVSE in 2021. Still, at the time Aqua was bind-boggling for someone still using Windows Me as a daily driver, and I spent a lot of time tweaking my KDE desktop to look like OS X.

Anyway, I now have a Mac LC II, which is basically a Color Classic built in pizza-box-desktop form (and for less than a tenth of the price), and that scratches the ol' System 7 itch. I got the iMac next, as the G3 is absolutely iconic and I got one in pristine condition for only $15. I long for the Bondi Blue clamshell G3 iBook of my youth, but I got a screaming deal on the next best thing: $40 for a dual USB iBook G3 (the white one, but it has the same keyboard and it still runs OS 9). From a compatibility standpoint, I didn't need all three machines - the iBook and iMac overlap almost entirely there, with the iBook having slightly more CPU horsepower, and the iMac having more IO and storage.

My problem was that neither one could run Halo, which I'd always wanted to try on a Mac for some reason, nor a few other mid-2000s 3D CDROM games I'd picked up over the last few years. So I needed something faster. I had my heart set on a 12" PowerBook G4, as they are just adorable, and would look so nice next to my white 12" G3. Alas, I instead ended up with two G4 laptops (lol, lmao): a 12" iBook G4, and a 15" PowerBook G4