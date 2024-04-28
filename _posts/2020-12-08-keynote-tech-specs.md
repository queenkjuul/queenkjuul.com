---
layout: post
title:  "Keydata Keynote MP-478 Tech Specs"
date:   2020-12-08 12:52:08 -0500
categories: dos keynote
---
# Keydata Keynote MP-978

## Also sold as  Chicony MP-978, FutureTec FM9700XL, Chem USA ChemBook 9780

First released in late 1997

![Image of a Keydata Keynote MP-978 14.1" Pentium MMX laptop](/archive/keynote/keydata1.jpg)

- [Keydata Keynote MP-978](#keydata-keynote-mp-978)
  - [Also sold as  Chicony MP-978, FutureTec FM9700XL, Chem USA ChemBook 9780](#also-sold-as--chicony-mp-978-futuretec-fm9700xl-chem-usa-chembook-9780)
  - [Tech Specs:](#tech-specs)
  - [Overview](#overview)
  - [Drivers](#drivers)
    - [Missing Drivers right now:](#missing-drivers-right-now)
  - [PHUTIL](#phutil)
  - [Windows 95](#windows-95)
    - [Installation](#installation)
    - [USB](#usb)
    - [Audio](#audio)
    - [Trackpad](#trackpad)
  - [MS-DOS \[+ WIN 3x \]](#ms-dos--win-3x-)
    - [Audio](#audio-1)
    - [CDROM](#cdrom)
    - [Trackpad](#trackpad-1)
    - [Cardbus/PCMCIA](#cardbuspcmcia)
  - [Other OSes](#other-oses)
    - [Ubuntu](#ubuntu)
    - [Other Linux](#other-linux)
      - [Porteus](#porteus)
      - [blueflops](#blueflops)
    - [BSD](#bsd)
    - [OS/2](#os2)
    - [Windows NT](#windows-nt)
  - [Caveats](#caveats)
    - [I/O](#io)
    - [LCD BIOS](#lcd-bios)
    - [Modular Internal Devices and Disk Drives](#modular-internal-devices-and-disk-drives)

## Tech Specs: 

- Intel Pentium MMX 233MHz 
  - Marketing materials indicate that this motherboard is also compatible with the AMD K6-2 300MHz CPU, and there are controls on the motherboard to adjust the CPU core voltage. BIOS release notes suggest later Pentium M support. 
- Yamaha OPL3-SAx (OPL4-ML / YMF704C-S) Audio
  - Sound Blaster Pro 2.0 (Old) emulation
  - MPU-401 MIDI Interface (with Gameport)
  - Windows Sound System device
  - 1MB Wavetable Synth
  - AdLib/OPL3 FM Synth
- Chips and Technologies CT65555 PCI XGA Adapter
  - Composite Video Input and Output (TV-IN, TV-OUT)
  - VGA output 
  - 4MB VRAM
  - 1024x768x24 (16M Colors)
- 14.1" Active Matrix TFT LCD Display (XGA 1024x768)
- 32MB PC100 SDRAM (144-pin SODIMM) [Upgraded to 96MB]
  - Motherboard jumper can set 3.3V or 5V operation
- 2GB Toshiba HDD2718/MK2104MAV IDE HDD (replaced with IDE2SD board)
- Intel 430TX Chipset
- Texas Instruments PCI-1131 Cardbus/PCMCIA Controller (2 slots, type II)
- Intel USB 1.1 PCI Bridge (2x USB ports, no BIOS USB input support)
- Matsushita / Panasonic / NEC UJDA110 20x CD-ROM (Replaced with TEAC DV-28E DVD-ROM)
  - Teac CD-220E was also used in production
- 3.5" Floppy Drive (NEC PC87306, Modular, removable, with proprietary LPT option for external use)
- Monochrome fixed-display LCD status screen at top of keyboard (displays PC card status; HDD, FDD, and CDROM activity; charger and battery status)
- Parallel Port
- 9-pin Serial Port
- Single PS/2 port
- Optional docking station 
- Optional built-in PCMCIA 56K Modem
- Optional second battery (fits in floppy bay, floppy can be used via LPT)

## Overview

Generally speaking, the MP-978 makes for an excellent MS-DOS gaming laptop. Originally shipped with Windows 95, the system configuration allows for widespread compatibility with nearly any PC game published in the first half of the 1990s. The lack of 3D accelerator hardware makes it less useful for Windows 98 games, though Windows 98 itself will run happily. OEM drivers are also available for Windows NT 4.0. The 4MB XGA graphics paired with the Pentium MMX 233MHz handle any 2D gaming workload with ease, and most early 3D titles (Duke3D, Doom, Quake, Wing Commander, XWING, System Shock) will run smoothly at high resolutions. Audio compatibility is also excellent, with a genuine Yamaha OPL3 FM synth, Sound Blaster Pro 2.0 emulation, MPU-401 MIDI interface, and a Windows Sound System compatible device. Compatibility is not perfect as the WSS and Sound Blaster modes share an IRQ, and the system defaults to IRQ 5 for the SBPro, though these resources can be easily changed in BIOS. Yamaha does provide official DOS utilities for resource allocation and mixing. 

## Drivers

FutureTec, who sold this model under the FutureMate FM9700XL name, still has all original drivers, including the latest BIOS update, on their website. 

[The FutureTec website is still up](http://www.futuretec.com/97xlftp1.htm) with the drivers available for download, but I have also mirrored them [here](../archive/keynote/oem/)

[FutureTec also has detailed specs and installation instructions](http://www.futuretec.com/97xlspec1.htm)

### Missing Drivers right now: 

- Internal 56K Modem 
  - This appears to be a custom right-angle PCMCIA card, and is likely supported by Win9x native built-in drivers, but I do not have an internal modem to test. 
- IrDA
  - Windows 95 will install generic IrDA drivers via the Add New Hardware wizard, which seem to install correctly, though I have no way to test them. No OEM IrDA drivers are supplied.
- Video Capture Drivers
  - CHIPSTV is the video capture application, but the only version I can find online does not install properly, and does not capture video when I force it to install anyway, though the program does run. I'm not sure if it's because it's a bad copy of CHIPSTV, or if it's because separate capture card drivers are missing. TV-OUT is at least nominally supported in the video output config, though I have not tested it
  - Full screen video capture mode (use LCD as display for external source) is enabled with Fn+F1. This does switch modes, but so far no available driver has resulted in an image on the screen in this mode. Fn+F1 again will switch back, but it takes some time to cycle (you might need to wait a minute and try again if it seems stuck)
  - Drivers for a 430TX motherboard, model PCM_5864 were found to include "Chips and Technology CT6555x / CT65545 CT69000 / CT69030 Video Capture Device" drivers, which at least partially function under Windows 95. While a copy of CHIPSTV was included with these drivers, it still does not function. 
  - Using the 5864 motherboard drivers, I did get a single distorted frame of a composite video signal to appear on screen using the Microsoft VIDCAP32.EXE utility, which is on some Windows 95 install discs or easily found online. A functional Linux installation with V4L may be able to make full use of the chip.

## PHUTIL

The BIOS supports Suspend-To-Disk, and can be configured to do so automatically when the battery gets critically low. Settings are all in BIOS. The PHUTIL.EXE file (part of self-extractor 97XLS2D.EXE) needs to be run from a DOS startup disk in order to create the second suspend-to-disk partition on the hard drive. It will automatically calculate the size of the partition based on installed RAM. As batteries of this vintage are universally dead, the utility serves little purpose unless you buy a replacement battery. 

## Windows 95

### Installation

1. Install the TX chipset drivers first after installing Windows 95
2. The PCMCIA slots are supported by the Windows 95 built-in drivers, but for some reason are disabled by default in Device Manager on a clean installation. Enable them to set up your cards. 
3. Nearly all OEM drivers, with the exception of the chipset, need to be installed via Device Manager

### USB

Tested USB using the USBSUPP package from an OSR2.1 OEM CDROM, but they did not work. Use [XUSBSUPP](https://msfn.org/board/topic/177518-xusbsupp-extended-usb-supplement-for-windows-95-osr2/) ([mirror](../keynote/oem/XUSBSUPP.ZIP)) instead. Be sure to follow the instructions and remove the "PCI Universal Serial Bus" device in Device Manager before installing. 

### Audio

Out of the box, Windows will detect the Sound Blaster Pro and Windows Sound System devices, however as the OPL3-SAx composite devices shares a single IRQ line for both WSS and SBPro, so sound will not work out of the box (though MIDI might). It is best to uninstall ALL sound devices (MPU-401, Sound Blaster, Windows Sound System, Gameport Joystick), then install OEM audio drivers. 

OEM drivers for Windows 9x do not supply any additional utilities for adjusting the 3D stereo controls. The Yamaha Audician 32 seems to be the most closely-related desktop card, and its utilities (and DOS drivers) can be installed on top of the OEM audio drivers. [This package from VOGONS seems to be compatible](http://vogonsdrivers.com/getfile.php?fileid=482&menustate=0) and can be installed after the hardware drivers are installed. In addition, standalone DOS utilities available from the wonderful [Phil's Computer Lab](https://www.philscomputerlab.com/audician-32-plus.html). 

The card features both the OPL3 FM synth as well as a "Software Wavetable" synth. I am not sure if this is purely in software (as it does work in pure DOS) or if there is a built-in hardware wavetable (which some comments on the FutureTec website seem to indicate). The wavetable synth will make noise any time General Midi is being played, both in Windows and DOS, so it is necessary to manually mute it when using an external MIDI module. 

### Trackpad

Trackpad works out of the box as a standard PS/2 device. It is a Logitech trackpad, and Logitech Mouseware  provides additional configuration options

## MS-DOS [+ WIN 3x ]

*Testing was mixed between MS-DOS 7.10 and MS-DOS 6.22 + WfW 3.11*

### Audio

The Audician 32 driver package includes a DOS resource and mixer utility, SETUPSA.exe. It can be used to change resource values and adjust levels. As noted in the Windows section, PCM is much louder than FM, so adjust accordingly. Wavetable synth will play when using external MIDI module, so mute it in the mixer if you are going to be using external GM/MT-32/SC/etc.

DOS compatibility is generally excellent thanks to the onboard OPL3 FM chip and Sound Blaster Pro support. The Audician 32 DOS utility works to set up resources and adjust the mixer settings. FM synthesis is drastically quieter than PCM, so adjust accordingly. External MIDI (MT-32/GM/SC) works as expected, though [SoftMPU](http://bjt42.github.io/softmpu/) was necessary for MT-32 support. 

The Windows 3.1 and MS-DOS packages from the incredible [Phil's Computer Lab](https://www.philscomputerlab.com/audician-32-plus.html) work perfectly with this card, and give you Windows MIDI Mapper controls in 3.x to switch between FM, Wavetable GM, and MPU-401 External. The 3.1 package will install the necessary DOS drivers, and initialize the setup utility which will run on next boot. 

When using Windows 3.1 and the Yamaha driver package, a couple small config file changes. Without these changes, Windows will throw an error saying that there is not enough extended memory for Windows to start (even when there is ample memory--my machine had 60MB available). In `C:\Windows\system.ini`, the line which loads the VSGM.386 driver needs to be removed (or commented out by placing a semicolon at the start of the line). I used to comment out the next lines in system.ini itself, but when the `setupsa.exe` would run in autoexec.bat, it would reset system.ini. Instead, we want to edit the `C:\OPL3SAX\OPL3SA.INI` file. In that file, the "CPLMPUCombine" line needs to be set to 1, and the "DelSoftSynth" line needs to be set to 1 as well. Once this is done, you will be able to start Windows normally after a reboot. This will mean you are stuck with FM or MPU for MIDI in Windows 3.1, but the built-in wavetable doesn't sound that great anyway and you can still use it in pure DOS. 

### CDROM

The machine was sold with either a NEC / Matsushita UJDA110, or a Teac CD-220E. Both are supported by standard ATAPI drivers, but additional OEM DOS drivers are supplied. Oddly, the "KME" drivers from FutureTec include multiple drivers, as well as some utilities like a Teac DOS CD player app. 

### Trackpad

Trackpad works out of the box with FreeDOS CuteMouse v1.9. Right click is not working in Windows 3.11 for some reason, using either MS PS/2 driver or the auto-detected Logitech driver. 

### Cardbus/PCMCIA

PC card support in DOS/Win3.x is very difficult. I have had luck using APSoft CardWare (older versions used to be floating online from SystemSoft, as it was included in countless OEM driver discs of the era, but I can now only find the most-recent free trial which beeps excessively on boot if not licensed) which does get my Cardbus Ethernet to be recognized. Have not yet been able to test this with Win3 as I am hitting memory management issues (working from a not-so-clean base). 

## Other OSes

### Ubuntu

Pentium MMX is officially too old for the modern Linux kernel, and 32-bit versions of Ubuntu 18.04 and 20.04 would not boot. Ubuntu 5.10 did boot, though the GUI did not properly load in the LiveCD. Installation went smoothly, but could not boot afterwards. 

### Other Linux

#### Porteus

Porteus (slackware-based) 4.0 would not boot (despite being labeled specifically as i586...), Porteus 3.1 for i386 did boot, but like Ubuntu, was unusable from the live CD, and did not present another way to install itself. 

#### blueflops

[Blueflops](http://blueflops.sourceforge.net/) works. I can't get it to work with my specific network card, but it does boot and it does so via floppy, which can be useful. The kernel is recent enough to have good PCI and USB support, which can help in troubleshooting (or hunting for Windows drivers). 

### BSD

Issues arose with all flavors of BSD due to a PCI_BUS_FIXUP bug. The only workaround that I could find would be to install NetBSD on another machine, compile a new NetBSD kernel on that machine with the PCI_BUS_FIXUP config flag, and then install that kernel on the laptop. If someone wants to try, be my guest. 

### OS/2

BIOS update changelogs indicate OS/2 support as of BIOS v1.16. VOGONS Yamaha32 package includes OS/2 audio drivers, though this is untested. 

### Windows NT

OEM Video and Audio drivers for Windows NT are available, other devices should work out of the box on NT4/2k+

## Caveats

### I/O

Without the OEM docking station, there is no straightforward way to use an external mouse, keyboard, and monitor at the same time. Personally, this made things difficult for setting it up alongside my other PCs and capture equipment. BIOS does not support USB input (no "USB Legacy" which means no USB mice or keyboards) and only one PS/2 port is provided.

### LCD BIOS

On early BIOS revisions, BIOS will not automatically switch to LCD display when BIOS is set to use the external display but no external display is connected. You will need to connect an external display to revert the setting and access setup. 

### Modular Internal Devices and Disk Drives

Floppy and CDROM drives use nonstandard connections. In the case of the CDROM, there is a plastic piece which screws onto the back of the drive and converts the 50-pin ATAPI plug into a different proprietary format. In addition, a thin aluminum strip is mounted on the left edge of the drive which is used to lock the drive in place (which can be released with a slider on the bottom of the case). Both the plug adapter and locking strip use standard mounting holes, which means any aftermarket CD or DVD drive can be installed (standard 1/2" IDE Slim drives). However, on the disc tray, there is a plastic trim piece which mounts onto the tray to give the drive a flush appearance with the rest of the case. Due to variances in the design of the trim piece from various CDROM manufacturers, you are unlikely to find a drive which will accept this trim piece unless you buy one of the OEM drives (NEC/Matsushita UJDA110 or Teac CD-220E). 

Floppy connection is also nonstandard, and features both a proprietary internal connection as well as a standard parallel port. It is unclear whether or not aftermarket replacement drives can also make use of the parallel port, though they should work with the internal connection should it need to be replaced (though this is untested). TEAC FD-05 is a drop in replacement, look for models with the mylar ribbon ZIF socket on the back, as the OEM bracket/adapter will attach to this. 

Factory options included a DR LS120MB combo floppy drive, and a 100MB ZIP drive. These were mounted with proprietary adapters on the back and trim on the front, and could be swapped out for the CDROM drive. Cursory research suggests compatible bare drives are unlikely to be found. 

