---
title: The Lab
layout: post
---

Technology is my absolute passion, and it drives my other creative outlets like music, video, and graphic design. So naturally, I've taken things to a bit of an extreme when it comes to my personal digital environment. I host a number of services, some public (among friends and family) and some private. I also maintain a network of vintage machines and consoles, as well as a high-performance LAN for my server and workstations.

## Running services

My main service host is an old desktop system running Ubuntu Server 22.04. All of my local services run on this machine, as well as most of my public services.

{:.tree-view}
- `router`
  - OpenWRT
  - 4x2.5GbE Realtek NIC
  - DHCP
  - DNS
  - Firewall
  - `netgear-ap`
    - Negear AX1800 WiFi 6 AP
  - `tplink-ap`
    - TP-Link 802.11ac AP
  - `retro-ap`
    - Linksys WRT54G2 802.11bg AP
  - `holodeck`
    - Ubuntu Server 22.04
    - All ZFS storage
    - 64TB total pool
    - 2x2.5GbE Realtek NIC
    - **Services**
      - Bare Metal:
        - [Caddy](https://caddyserver.com/)
        - [Samba](https://samba.org)
        - [WireGuard](https://wireguard.com)
      - Docker:
        - [Plex](https://plex.tv)
        - [NextCloud](https://nextcloud.com)
        - [Baikal](https://sabre.io/baikal/)
        - [Homepage](https://gethomepage.dev/latest/)
        - [BackupPC](https://backuppc.github.io/backuppc/)
        - [Grafana Loki](https://grafana.com/docs/loki/latest/)
        - [Tautulli](https://tautulli.com/)
        - [Your Spotify](https://github.com/Yooooomi/your_spotify)
        - [EmulatorJS](https://github.com/linuxserver/docker-emulatorjs)
        - [Super Mario 64](https://mario.queenkjuul.com)
        - [queenkjuul.com](https://queenkjuul.com)
      - VirtualBox
        - [vsftpd](https://security.appspot.com/vsftpd.html)
        - [Netatalk](https://netatalk.io/)
    - `pbx.starfleet.lan`
      - Raspberry Pi 4
      - **Services**
        - [FreePBX](https://www.freepbx.org/)
- Cloudflare
  - [juliehill.rocks](https://github.com/queenkjuul/juliehill.rocks)
- Oracle Cloud
  - [queenkjuul.xyz](https://queenkjuul.xyz)
  - WireGuard
- Render
  - [La Biblioteca (React demo)](https://biblioteca-pf7p.onrender.com)

## The Fleet

I have an extensive collection of vintage equipment, which I try to keep in functional condition as well as connected to network services. I also try to get all systems connected via modern video formats (converting native output to HDMI) and feeding that to switching and capture equipment. vsftpd provides FTP services for all clients while Netatalk provides services for the Macintosh fleet. A secondary MAC-filtered wifi AP provides wireless access to my iBook, PS3, PSP, and Wii.

Dial up networking is a WIP, I have a working PBX and can place calls using analog phones within my home network via VoIP ATAs. However I have not set up the PPP bridge to allow dial-up clients to access LAN/internet services. Eventually, the Tandy and Dreamcast should be able to get online via dial-up over a local PPP bridge, and I plan to set up a BBS and other telnet services once that's running.

I plan to update [queenkjuul.com](https://queenkjuul.com) with more details on my retro adventures as well as host hard-to-find drivers and utilities, but it is a work in progress.

### Consoles

- Nintendo Switch (HDMI / Ethernet)
- Nintendo Wii (YPbPr / Ethernet)
- Nintendo GameCube (YPbPr)
- Nintendo 64 (SVHS)
- PlayStation 3 (HDMI / Ethernet)
- PlayStation 2 (YPbPr / TOSLINK / Ethernet)
- Sega Dreamcast (VGA / Dial-up)
- Sega Genesis (YPbPr)
- Panasonic FZ-10 3DO (SVHS)

Analog consoles feed either the YPbPr or CVBS/SVHS switch boxes. Those feed an Extron 1508 Scaler/Switcher which outputs VGA to an Extron VGA-HDMI ADC. HDMI inputs feed a 6x2 HDMI Matrix which ouputs to my capture card, TV, and Denon receiver. I have retro-bit wireless controllers for the Genesis, BlueRetro adapters for the 3DO, N64, and Gamecube, and Retro Fighters Defender wireless controllers for the PS2. The Dreamcast has a bluetooth adapter as well as an SD card installed in the serial port. The PS2 loads games via ethernet from an SMB share, while the Wii has a local USB drive for ISOs and the PS3 has been upgraded with a 1TB SSD. The Gamecube is modded using PicoBoot and an SD2SP2 adapter, and knockoff flash carts are used with the N64 and Genesis.

### Computers

- 1986 Tandy Color Computer 2
  - Tandy BASIC
  - Motorola 6809 900KHz (0.9MHz)
  - 64KB DRAM
  - Serial modem
- 1986 Compaq Deskpro 286
  - PC-AT Compatible
  - MS-DOS 6.22 / Windows 3.1
  - Intel 286 12MHz
  - 2125KB DRAM
  - Orchid Technology 1MB SVGA
  - AZTech OPL3 / SB Pro Audio
  - 10/100BaseT
- 1993 Apple Macintosh LC II
  - Mac OS 8 / System 7 / System 6
  - Motorola 68030 16MHz
  - Motorola 68882 Math Coprocessor
  - 10MB SIMM DRAM
  - 10/100BaseT
- 1997 Keydata Keynote 9700XL Laptop
  - MS-DOS 6.22 / Windows for Workgroups 3.11
  - Pentium MMX 233MHz
  - 96MB PC100 SDRAM
  - 14.1" XGA TFT Screen
  - Yamaha OPL3-SAx Audio
  - D-Link 10/100BaseT PCMCIA
- 2000 Dell Dimension 4100
  - Windows 98SE
  - Pentium III 1GHz
  - 512MB PC133 SDRAM
  - ATi Radeon 9550 256MB
  - Creative Sound Blaster Live! Audio
  - Realtek 1000BaseT
- 2001 Apple iMac DV SE
  - Mac OS 9.2.2
  - PowerPC G3 750 400MHz
  - 128MB PC133 SDRAM
  - ATi Rage 128 VR 8MB
  - 10/100BaseT
- 2001 Apple iBook G3/500 White
  - Mac OS 9.2.2 / Debian 8
  - PowerPC G3 750cx 500MHz
  - 128MB PC133 SDRAM
  - ATi Rage Mobility 128 8MB
  - Apple AirPort 802.11b
  - 10/100BaseT
- 2005 fitPC Embedded
  - AMD GeodeLX
  - Windows Server 2003
  - Dial up / PPP bridge to LAN/internet (WIP)
