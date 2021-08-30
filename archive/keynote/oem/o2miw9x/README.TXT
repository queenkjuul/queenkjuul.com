Software Utilities for O2Micro Cardbus Controllers
--------------------------------------------------

Utility files on this disk:

        O2SETUP.EXE             - O2Micro Setup Utility
        O2SETUP.INI             - O2Micro Setup Initialization file        
        O2MEMCHK.EXE            - O2Micro Memory Resource Checker
        README.TXT              - This test file

        WIN95 <directory>
           O2MICRO.INF          - O2Micro Win95 (OSR2) Information file
           CB725720.W95         -    "    CardBus Driver for Windows 95
           PCCARD.VXD           - Microsoft PCCard Driver for Windows 95
           PCI.VXD              -     "     PCI Driver for Windows 95

        WIN98 <directory>
           O2MICRO.INF          - O2Micro Win98 Information file
           CB511717.W98         -    "    CardBus Driver for Windows 98

        UTIL <directory>
           O2INIT.DOC           - O2Micro Dos Init Utility Documentation
           O2INIT.SYS           -   "     Init Utility Device Driver
           O2INIT.COM           -   "      "      "    Program
           PREG.EXE             -   "     PCI Register Dump Utility
           O2.EXE               -   "     PCMCIA ExCA Register Dump Utility        
           O2ACPI.EXE           -   "     ACPI Mode Utility
           O2SW.EXE             -   "     Zoom-Video Switch/Enable Utility
           OZ6812A.DAT          -   "     CardBus Controller Setup Data Files
           OZ6832C.DAT
           OZ6832C2.DAT
           OZ6833B.DAT
           OZ6860A.DAT
           OZ6860C.DAT

Utility File Descriptions:

  o2init.sys, o2init.com, o2init.doc:
    These files are used to initialize various registers on the O2Micro cardbus
    controller from a script (.dat) file.  See o2init.doc for help.

  preg.exe:
    A DOS utility to view/edit PCI configuration space of PCI devices.

  o2sw.exe:
    A Windows utility to control O2Micro Zoom Video features.

  o2.exe:
    A DOS utility to view/edit PCMCIA ExCA registers.

  o2acpi.exe:
    A Windows utility to enable/set ACPI modes of an ACPI CardBus controller.



O2Micro Cardbus Controller Software Installation
------------------------------------------------

  Win95 (release 1):

  Win 95 supports PCMCIA/PCIC controllers, but does not directly support
  CardBus controllers.  A newer bios will initialize a CardBus chip
  as a Legacy mode PCIC controller, but bioses that do this are still
  rare.  If your bios does not initialize the CardBus controller to
  Legacy mode, use o2init.sys to initialize the controller at boot time.

  To install:
    1. Copy the software to the hard disk:
         cd c:\
         mkdir c:\o2
         copy a:\util\*.* c:\o2\. /v

    2. Edit "Config.sys": (add the following line to beginning of file)
         device=c:\o2\o2init.sys c:\o2\OZ68????.dat
         Where: ???? is the appropriate file for the device being installed

    3. Shutdown Windows and Power-off the system.
    4. Install the O2Micro Cardbus card and reboot Windows.
    5. In "Control Panel" do "Add Hardware", "Pcmcia", "PCIC", and exit.
    6. In "Control Panel" run "Pcmcia" to enable 32 bit support.
    7. Reboot Windows to load the new PCIC driver.


  Windows95 OSR2 and Windows98:

  Install the O2Micro board and run O2Setup.exe.  This will copy
  some files and add registry keys.  You will have to reboot to load
  the new drivers.

  To install:
    1. Copy the software to the hard disk:
         cd c:\
         mkdir c:\o2
         xcopy a:\*.* c:\o2\. /s/e/v

    2. Edit "Config.sys": (add the following line to beginning of file)
         device=c:\o2\util\o2init.sys c:\o2\util\OZ68????.dat
         Where: ???? is the appropriate file for the device being installed

    3. Shutdown Windows and Power-off the system.
    4. Install the O2Micro Cardbus card and reboot Windows.
    5. Run O2Micro Setup Program (C:\O2\O2SETUP.EXE).
    6. Reboot Windows to redetect new hardware.


  Windows3.1/3.11 and MS-Dos:

  Win 3.1 and MSDos do not include any drivers for Cardbus or Pcmcia.  You
  will need to install third party drivers from Phoenix, SystemSoft, Award,
  or others to test the O2Micro controller.  You need to put the controller
  in the Legacy mode before installing the third party software.

  To install:
    1. Copy the software to the hard disk:
         cd c:\
         mkdir c:\o2
         copy a:\util\*.* c:\o2\. /v

    2. Edit "Config.sys": (add the following line to beginning of file)
         device=c:\o2\o2init.sys c:\o2\OZ68????.dat
         Where: ???? is the appropriate file for the device being installed

    3. Power-off the system.
    4. Install the O2Micro Cardbus card and reboot Windows.
    5. Load 3rd party PCMCIA software.


Debugging an O2Micro Cardbus controller:

    A cardbus controller is a PCI device with standard PCI registers.  The
  cardbus controller registers are memory mapped at the location set in PCI
  register 10h.  Under Win95, the device manager properties can be examined
  to find that memory location.  However, Win95 maps this memory to some
  other address.  This makes debugging the cardbus controller a bit tricky.

    The easiest way to debug is to use SoftIce for Win95.  To find the
  cardbus registers in SoftIce, use the 'phys' command to translate the
  memory address to the physical memory address.  For example 'phys C8000'
  gives an address like C1297000.  To dump the registers do 'd #30:c1297000'.
  Cardbus registers are mapped into this memory block at offset 0, and the
  pcmcia/ExCA registers are mapped into this memory at offset 800h.

    The O2Micro Cardbus Controller is a single chip with 2 PCI devices
  (functions).  Windows 95 views the chip as 2 separate PCI devices so there
  are two O2Micro entries in the Device Manager display, and there are two
  blocks of memory allocated, one for each PCI function of the controller.
  You find the memory mapped registers for each function the same way,
  but Win95 maps their addresses independently and they might not be in
  contiguous locations.  Take care when translating the memory addresses,
  and also make sure the the memory you are viewing is correct for the
  slot you are testing.

