****************************************************************************
****************************************************************************
*                                                                          *
*       Intel(R) 82371xB INF Update Installer for Windows 95*              *
*       Installation, Usage, and Release Note Information                  *
*                                                                          *
*       Revision:   3.2.2 Production Release                               *
*       Date:       April 24, 1998                                         *
*                                                                          *
*       NOTE:                                                              *
*          This document refers to desktop systems with                    *
*          the following Intel(R) PCIset and Intel(R) AGPset               *
*          devices:                                                        *
*          82371SB (PIIX3), 82371AB (PIIX4), 82371EB (PIIX4E)              *
*          in conjunction with the following Intel(R) PCIsets and          *
*          Intel(R) AGPsets:  430HX, 430VX, 430TX, 440FX, 440LX,           *
*          440EX and 440BX.                                                *
*                                                                          *
*          The term "82371xB" refers to any/all of the                     *
*          following Intel(R) PCIset and Intel(R) AGPset devices:          *
*          82371SB, 82371AB, 82371EB                                       *
*                                                                          *
*          Also, the term "processor" refers to the Intel(R) Pentium(R)    *
*          processor, Pentium(R) processor with MMX(TM) Technology,        *
*          Pentium(R) Pro processor, Pentium(R) II processor and           *
*          Celeron(TM) processor devices ONLY.                             *
*                                                                          *
****************************************************************************
****************************************************************************


****************************************************************************
*       INTRODUCTION                                                       *
****************************************************************************
This utility program was developed for updating several
Windows 95* INF files so that Intel(R) 82371SB, 82371AB, and 82371EB
components can be recognized or configured properly in the
system.

***************************************************************************
*       CONTENTS OF THIS DOCUMENT                                         *
***************************************************************************
This document contains the following sections:

1.  System Requirements
2.  Contents of the Distribution Package
3.  INF Files updated the Software
4.  Running the Software
5.  Verifying INF Update by the Software
6.  Troubleshooting
7.  Release Notes

****************************************************************************
* 1.  SYSTEM REQUIREMENTS                                                  *
****************************************************************************
This section describes the system requirements for Intel(R) 82371xB
INF Update Installer.

NOTE:  This utility is designed for and tested with Windows 95*
       only.

1.  The system must contain a supported Intel(R) processor and chip set
    configuration:

        Chip set:  Intel(R) 430FX, 430HX, 430TX, 430VX, 440FX, 440LX, 440EX
                   and 440BX PCIsets and AGPsets.
        Processor: Intel(R) Pentium(R) processor, Pentium(R) processor with 
                   MMX(TM) Technology, Pentium(R) Pro processor, 
                   Pentium(R) II processor and Celeron(TM) processor
                   devices ONLY.

2.  Ensure that a mouse is connected to the system.

3.  One of the following versions of Windows 95*  must be
    installed on the system prior to running utility program.
    Windows 95* 4.00.950   (Retail)
    Windows 95* 4.00.950b  (OSR2 without USB Supplement)
    Windows 95* 4.00.950b  (OSR2.1 with USB Supplement)

4.  This utility should only be used on desktop systems.  The
    utility must not be executed on notebook or portable systems
    with or without dock.

5.  It is assumed that all devices in system are enabled.  This
    utility may not work properly if there are devices in the
    system which are disabled.

****************************************************************************
* 2.  CONTENTS OF THE DISTRIBUTION PACKAGE                                 *
****************************************************************************
Intel(R) 82371xB INF Update Installer for Microsoft Windows 95
package contains the following items:

Date      Time        File
----      ----        ----
                      SETUPEX.EXE
12/10/97  12:00a      README.TXT
12/10/97  12:00a      DATA.TAG
12/10/97  12:00a      DATA1.CAB
12/10/97  12:00a      LANG.DAT
12/10/97  12:00a      LAYOUT.BIN
12/10/97  12:00a      OS.DAT
12/10/97  12:00a      SETUP.EXE
12/10/97  12:00a      SETUP.INS
12/10/97  12:00a      SETUP.INI
12/10/97  12:00a      SETUP.LID
12/10/97  12:00a      _INST32I.EX_
12/10/97  12:00a      _ISDEL.EXE
12/10/97  12:00a      _SETUP.DLL
12/10/97  12:00a      _SYS1.CAB
12/10/97  12:00a      _USER1.CAB


****************************************************************************
* 3.  INF FILES UPDATED BY THE SOFTWARE                                    *
****************************************************************************

The Intel(R) 82371xB INF Update Installer will update the INF files
depending on which release of Windows 95* is used and which Intel(R)
82371xB component is present in the system.  The following
table lists the INF files affected by the INF Update Installer:

INF File    Windows 95*  Windows 95*    Windows 95*
             4.00.950     4.00.950b      4.00.950b
             Retail      OSR2 w/o USB   OSR2.1 w/ USB
----------- -----------  -----------    -----------  
MSHDC.INF        x            x             x

MACHINE.INF      x            x             x

USB.INF          N/A         N/A            x


Note:  USB.INF is only updated if Windows 95* 4.00.950b with
       USB Supplement is installed.

Please check with your system provider to determine which OS
release and which Intel(R) 82371xB component are used in your
system.


****************************************************************************
* 4.  RUNNING THE SOFTWARE                                                 *
****************************************************************************
This procedure is specific only to the version of the software
included in this package.

This subsection describes how to run the software on a system
where Windows 95* is installed.

1.  Check the System Requirements.  Windows 95* must be fully
    installed and running on the system prior to running this
    software.

2.  Close any running applications.  You may experience some
    difficulties if you don't do this.

3.  Run SETUP.EXE.

4.  Click Next on Welcome Screen to read and agree to the license agreement.
    
5.  Click Yes if you agree to continue.  Note:  If you click No,
    program will terminate.

6.  Click Next on Installer screen.

7.  Click OK to restart.

8.  Follow the screen instructions and use default settings to
    complete the setup when Windows 95 is re-started.


****************************************************************************
* 5.  VERIFYING INF UPDATE BY THE SOFTWARE                                 *
****************************************************************************
Run Device Manager to verify that INF files have been updated
properly:

1.  Click on Start
2.  Select Settings
3.  Select Control Panel
4.  Double click on System icon
5.  Click on Device Manager tab
6.  Click on View devices by type button
7.  Click on System Devices 
8.  Check the descriptions for one of the following entries:
        Intel 82371AB/EB PCI to ISA bridge
        Intel 82371SB PCI to ISA bridge
    If you see PCI standard ISA bridge you will need restart your
    system and re-run the software.

****************************************************************************
* 6.  TROUBLESHOOTING                                                      *
****************************************************************************
It is assumed that the system requirements from subsection #1
above have been satisfied.

COMMON PROBLEMS or Questions:
*****************************

#1 > 1a.  How do I know the INF files in my system require update?
     1b.  My system works just fine without running this utility
          program.  Do I still need to update my INF files?
     1c.  What will happen if I do not update my INF files?

ANS> This software utility checks whether your system contains an
     Intel(R) 82371xB component and the appropriate operating
     system before performing any updates.  If your system needs
     the update, it will be performed.  If your system doesn't
     need the update, the program will inform you and terminate.


#2 > System locked up during Device Manager Remove or during
     restart.

ANS> System lockup can occur during Device Manager Remove
     operation or Control Panel Restart as a result of
     possible system issues during these operations.
     In the event of system lockup, restart the machine
     and view Device Manager.  If devices are listed
     properly and system experiences no further problems,
     then .INF file restore process was successful.
     If devices are not configured correctly try re-running
     the INF Update Installer.  If this does not fix problem
     or further problems are experienced, re-install
     Windows 95*.

#3 > I want to restore my original INF files.

ANS> The INF Update Installer will update the INF files as
     necessary.  Intel recommends that the updated INF files
     be used with Intel(R) 82371xB components to function properly
     in the system.  However, the following procedures can be
     used if one desires to restore the original INF files.

     The original INF files are backed up as MSHDC.xxx,
     MACHINE.xxx, or USB.xxx where xxx is a 3 digit number
     (for example, 000, 001, etc.).  This utility program
     attempts to save the original INF files as *.000, but if
     that file name is already in use the utility program will
     keep incrementing the file extension until it finds one
     that is not in use.

     For example, to restore the original "MSHDC.INF" file:

    1.  Make copy of new existing "MSHDC.INF" files.
            C:> copy MSHDC.INF MSHDC.NEW
    2.  Restore the original "MSHDC.INF" file.
            C:> cd \<Windows 95 Path>\INF\
            C:\<Windows 95 Path>\INF> copy MSHDC.000 MSHDC.INF
    3.  Repeat step 1 - 2 for MACHINE.INF file or USB.INF file
        as needed.
    4.  Run the Control Panel->System applet.
    5.  Click on Device Manager
    6.  Click on View devices by connection.
    7.  Click on Plug and Play BIOS.
    8.  Click on PCI bus.
    9.  Select Remove.
    10. Select Yes to restart the system.
    11. Windows 95 will display messages when various hardware
        components in the system are recognized.  When prompted to
        install a driver, select the Windows Default driver or
        appropriate device drivers from disk provided by the hardware
        manufacturer if needed.
    12. Select Yes to restart the system.  (Steps 10-11 may occur
        several times.)
    13. Re-install the custom drivers from disk provided by the
        hardware manufacturer if needed.


#4 > I am using Windows 95* operating system Version 950A (OSR1) and
     my IDE controller is preceeded with a yellow "!" in Device Manager
     after I run this software utility.

ANS> If you are using Windows 95* operating system Version 950A (OSR1), 
     with the Windows default IDE driver, this can happen.  The suggested
     procedure OSR1 users is incorporating updated MACHINE.INF and MSHDC.INF
     files at the time of OS installation.  This is documented in 
     PIIX4 Application Note #4.

****************************************************************************
* 7.  RELEASE NOTES                                                        *
****************************************************************************
Version 1.0 is the initial release of Intel(R) 82371xB INF Update Installer 
for Windows 95*.

Version 2.0 added support for 824403LX/EX components.

Version 3.0 added the following:
   - support Intel(R) 82433LX Pentium II Processor to AGP Controller
     for OSR2/OSR2.1 operating system
   - name string 82371AB changed to 82371AB/EB
   - [PCI_DRV_AddReg] components written to .INF file

Version 3.1 added the following:
   - support for 82440BX AGPset

Version 3.2 added the follwoing:
   - name string change for LX/EX chipset

****************************************************************************
****************************************************************************
Intel is making no claims of usability, efficacy or warranty.  The SOFTWARE 
USE AND DISTRIBUTION LICENSE AGREEMENT completely defines the license and 
use of the Intel(R) 82371xB INF Update Installer.
****************************************************************************
Information in this document is provided in connection with Intel products. 
No license, express or implied, by estoppel or otherwise, to any intellectual
property rights is granted by this document.  Except as provided in Intel's 
Terms and Conditions of Sale for such products, Intel assumes no liability 
whatsoever, and Intel disclaims any express or implied warranty, relating to 
sale and/or use of Intel products including liability or warranties relating 
to fitness for a particular purpose, merchantability, or infringement of any 
patent, copyright or other intellectual property right. Intel products are 
not intended for use in medical, life saving, or life sustaining applications.

****************************************************************************
* Intel Corporation disclaims all warranties and liabilities for the use   *
* of this document and the information contained herein, and assumes no    *
* responsibility for any errors which may appear in this document, nor     *
* does Intel make a commitment to update the information contained herein. *
* Intel reserves the right to make changes to this document at any time,   *
* without notice.                                                          *
****************************************************************************
****************************************************************************

* Third-party brands and names are the property of their respective owners.

Copyright (c) Intel Corporation, 1995-1998

