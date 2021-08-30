   ***** How to install the device driver under DOS environment *****

 To operate TEAC CD-ROM,the device driver (TEAC_CDI.SYS) has to be installed
from INSTALLATION DISK came along with CD-ROM.
 Please follow the instruction below.

1. Boot up the system and insert the INSTALLATION DISK into your floppy
   disk drive.

2. At the DOS prompt,type "A:\INSTALL" then press enter. (If your floppy
   disk drive is "A:")

3. Installation program will now start.Please follow the instructions on the
   screen to complete the installation procedure.

4. When finish,remove the INSTALLATION DISK from the floppy disk drive then
   REBOOT your system.

   During system reboot,check for the following message to assure that
   the driver was loaded properly.

	MSCDEX Version 2.23
	Copyright (C) Microsoft Corp. 1986-1993. All rights reserved.

		Drive X: = Driver TEAC-CDI unit 0

		* 'X:' ... Drive letter assigned to CD-ROM Drive

	This message means that TEAC CD-ROM drive is now activated.

*  Now the installation of TEAC CD-ROMdrive is completed.


  ***** TEAC CD-ROM DRIVE Trouble Shooting Tips *****

------------------------------------------------------------------------------
Q1: System will not boot when CD-ROM drive is daisy-chained with
    hard disk drive.
------------------------------------------------------------------------------
A1: Be sure your hard disk drive jumper is set to MASTER and CD-ROM's to SLAVE.
   Please refer to the installation manual for CD-ROM jumper setting and ask 
   hard drive manufacturer for MASTER jumper setting.
   Note: There may be a case where CD-ROM can not be daisy-chained with
         Conner hard drive (Conner mode).
A2: Check if the I/F cable is connected reversely.

------------------------------------------------------------------------------
Q2: System hangs without displaying anything when the device driver is loaded
   during Boot-up.
------------------------------------------------------------------------------
A1:There is a possibility that TEAC device driver is having a conflict with 
   others. Please check the position of the device driver statement or remark
   driver which may be having a conflict with.
A2:In case that TEAC CD-ROM drive is connected with non TEAC CD-ROM drive in
   the same system.
   Please re-install the TEAC CD-ROM address by going through 'SELECT I/O PORT'.

------------------------------------------------------------------------------
Q3: "Not Install Device Driver" message is displayed during loading the device
   driver.
------------------------------------------------------------------------------
A1:Please make sure that Power cable and I/F cable are properly connected.
A2:Please make sure that there is no conflict with IDE card address (primary, 
   secondary, tertiary etc.) and/or interrupt.
A3:In case that CD-ROM drive is daisy-chained with hard disk drive, please
   make sure that hard disk drive jumper is set to MASTER and CD-ROM's to SLAVE.
   Please refer to the installation manual for CD-ROM jumper setting and ask
   hard drive manufacturer for MASTER jumper setting.
A4:In case that your IDE I/O address is set to Tertiary/Quaternary, please 
   re-install the TEAC CD-ROM Software to change the address by selecting
   'SELECT I/O PORT'.
A5:There will be the case where TEAC CD-ROM drive will not work with IDE
   Controller card with Cache.

------------------------------------------------------------------------------
Q4: CD-ROM drive will not be recognized by the system when MSCDEX.EXE
    is loaded.
------------------------------------------------------------------------------
A: Drive names specified in Config.sys and Autoexec.bat may not be matching.
   Please make sure that each statement has "/D:TEAC-CDI"

------------------------------------------------------------------------------
Q5: System does not recognize the CD-ROM drive with error message "Not enough
   drive letters".
------------------------------------------------------------------------------
A: There may be no more Drive letter available. Please add or edit "LASTDRIVE"
   statement so that the last drive equals one more than your current last drive.
	(Example)
		Current			New
		A:FDD			A:FDD
		B:FDD			B:FDD
		C:HDD			C:HDD
		D:HDD			D:HDD
					E:CD-ROM -> "LASTDRIVE=E"

------------------------------------------------------------------------------
Q6: Getting the display "CDR101: Not Ready" when CD-ROM is accessed.
------------------------------------------------------------------------------
A: Please make sure that the disk is inserted in the drive or is not placed up 
   side down.

------------------------------------------------------------------------------
Q7: Getting the display "CDR103: CD-ROM not High Sierra or ISO 9660 format"
   when CD-ROM is accessed.
------------------------------------------------------------------------------
A: This message will be displayed when non-standard CD is accessed.
	(Example) Placing Audio CD and accessing it without going into CDPLAYER.

------------------------------------------------------------------------------
Q8: CD-ROM drive is not recognized when RAM Boost is used.
------------------------------------------------------------------------------
A: Please insert the TEAC device driver statement before Ram Boost statement
   in your Config.sys.

------------------------------------------------------------------------------
Q9: Do I need BIOS CMOS Setup for my IDE CD-ROM ?
------------------------------------------------------------------------------
A: No,CD-ROM is not supported by BIOS.It is different from Hard Disk Drive.
   Please select "none" for BIOS Setup of CD-ROM I/O port.

------------------------------------------------------------------------------
Q10: CD-PLAYER for Windows will not work.
------------------------------------------------------------------------------
A: To operate CD-PLAYER for Windows,[MCI]CD Audio has to be installed in
   Drivers in Control Panel.Please refer to Windows manual to install
   [MCI]CD Audio.

------------------------------------------------------------------------------
Q11: How can I see Photo CD ?
------------------------------------------------------------------------------
A: You have to use Photo CD access software released from Kodak,Corel or
   Adaptec to see Photo CD.

------------------------------------------------------------------------------
Q12: How can I see CD-I/Video CD ?
------------------------------------------------------------------------------
A: You need MPEG Playback Card (Ex.RealMagic) to play CD-I/Video CD/Karaoke CD.
   You can see a directory of Video CD but not of CD-I.

------------------------------------------------------------------------------
Q13: I can't play CD-I.
------------------------------------------------------------------------------
A: There are two kinds of Disk.One is called CD-I which you have to use
   CD-I player and the other is CD-I Digital Video which you can play with
   CD-ROM drive and MPEG Playback Card.

------------------------------------------------------------------------------
Q14: Video CD Ver.2.0 can be played ?
------------------------------------------------------------------------------
A: It depends on your MPEG Playback Card.

------------------------------------------------------------------------------
Q15: Will CD-ROM drive work with i386 system ?
------------------------------------------------------------------------------
A: Yes,it will work with i386 but i486 or higher system is recommended to get 
   better performance.

------------------------------------------------------------------------------
Q16: How can I use CD-ROM under OS/2 ?
------------------------------------------------------------------------------
A: TEAC CD-ROM will work with the embedded ATAPI driver in OS/2 Warp Ver.3.0.

------------------------------------------------------------------------------
Q17: How can I get the device driver for Windows NT/95 ?
------------------------------------------------------------------------------
A: Please select embedded ATAPI driver in Windows NT/95.


==============================================================================
			Technical support
==============================================================================
		TEAC America Inc.
			Phone		213-727-4860
 			BBS		213-727-7660
			Fax on Demand	213-727-7629
