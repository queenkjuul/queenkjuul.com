
        *****************************************************
        *             for ATAPI CD-ROM drive                *
        *****************************************************

        /////////////////////////////////////////////////////
        ///                                               ///
        ///  Manual for using installer (DOS, OS/2)       ///
        ///                                               ///
        ///             Making   date:  11/23/95          ///
        ///                                               ///
        ///  Copyright (C) 1995 by MKE(Panasonic)         ///
        ///  (Matsushita Kotobuki Electronics Co,.LTD)    ///
        ///             All rights reserved.              ///
        ///  Documentation by Device Driver Project(DDP)  ///
        ///                                               ///
        /////////////////////////////////////////////////////

*******************************************************************************
(A)     PC-DOS and MS-DOS installtion Procedure
        (also supported for Windows 3.1 / Windows For Workgroup 3.11)
*******************************************************************************

1. Supported CD-ROM drive:
        <ATAPI Interface CD-ROM>
        CR-572-B (2x, tray loading type)
        CR-574-B (4x, tray loading type)
        CR-581-x (4x, tray loading type)
        CR-171-x (8x, slim type)
        CR-172-x (20x, slim type)

2. Installer file name:
        INSTALL.EXE (Version 1.10, common file for installation)
        INSTALL.DAT (installation's data file for ATAPI CD-ROM)

3. Discription for execution:
        Please type following from the DOS prompt:
                'A:'[return]  or 'B:'[return]
                'INSTALL' [return]


*******************************************************************************
(B)     OS/2 2.1, 2.11, and Warp 3.0 installtion Procedure
*******************************************************************************

1. Supported CD-ROM drive:
        <ATAPI Interface CD-ROM>
        CR-572-B (2x, tray loading type)
        CR-574-B (4x, tray loading type)
        CR-581-x (4x, tray loading type)
        CR-171-x (8x, slim type)
        CR-172-x (20x, slim type)

2. Installer file name:
        INSTOS2.EXE (Version 2.10, common file for installation)
        INSTOS2.DAT (installation's data file for ATAPI CD-ROM)

3. Discription for execution:
        Please type following from the DOS prompt:
                'A:'[return]  or 'B:'[return]
                'INSTOS2' [return]


Trademarks and Copyrights:
        PC-DOS is a trademarks of International Business Machines Corporation.
        MS-DOS is a trademark of Microsoft corporation.
        OS/2 is a trademarks of International Business Machines Corporation.
        Windows 3.1 is a trademark of Microsoft corporation.
        Sound Blaster is a trademark of Creative Labs, Inc.




------------ cut here ------------ cut here ------------ cut here ------------




        /////////////////////////////////////////////////////
        ///                                               ///
        ///Device Driver supportted STATUS in CD-ROM drive///
        ///                                               ///
        ///             Making   date:  11/23/95          ///
        ///                                               ///
        ///  Copyright (C) 1995 by MKE(Panasonic)         ///
        ///  (Matsushita Kotobuki Electronics Co,.LTD)    ///
        ///             All rights reserved.              ///
        ///  Documentation by Device Driver Project(DDP)  ///
        ///                                               ///
        /////////////////////////////////////////////////////

*******************************************************************************
(C)     PC-DOS and MS-DOS device driver support
        (also supported for Windows 3.1 / Windows For Workgroup3.11)
*******************************************************************************

1. Supported CD-ROM drive:
        <ATAPI Interface CD-ROM>
        CR-572-B (2x, tray loading type)
        CR-574-B (4x, tray loading type)
        CR-581-x (4x, tray loading type)
        CR-171-x (8x, slim type)
        CR-172-x (20x, slim type)

2. Device Driver name:
        CR_ATAPI.SYS (Version 5.17v) for DOS
        WDCTRL.386   (Version 1.10 ) for 32bitDiskAccess=ON in Windows3.1

   !!! CAUTION !!!
        You can not use WDCTRL.386, when you use 32bitFileAccess=ON in WFW3.11.
        Please change 32bitFileAccess=ON to 32bitFileAccess=OFF.

3. Driver discription:
        [/D:xxxxxxx]    ---> Device name option
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000

        *[/P:nnn]       ---> ATAPI base I/O Port Address(hex) option
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000 /P:nnn
                nnn==1F0, 170, 1E8 or 168
                Primary connection:     nnn==1F0
                Secondary connection:   nnn==170
                Tertiary connection:    nnn==1E8(Sound Blaster IDE)
                Quaternary connection:  nnn==168(Sound Blaster IDE)

        *[/I:xx]        ---> Interrupt number option(IRQ=10,11,12,14,15)
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000 /I:xx
                Primary connection:     xx==14,10,11,12 or 15
                Secondary connection:   xx==15,10,11,12 or 14
                Tertiary connection:    xx==10,11,12,14 or 15
                Quaternary connection:  xx==10,11,12,14 or 15

        *[/W:n]         ---> Waiting value option
                When PC read data from CD-ROM drive, Driver insert waiting
                value into read cycle one by one.
                If you are using PC that are not supported IOCHRDY, please set
                this value(waiting value).
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000 /W:n
                n==0, 1, 2, ... 255
                        (For example 106usec/1 wait in 486DX2 66MHz)

        *[/Q]           ---> Non stop option
                Non stop(no message <A>bort, <R>etry) in initializing driver.
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000 /Q

        *[/E]           ---> Available error correction
                This option is available error correction for CD-G application.
                (Player for not including error correction)
                ex.)DEVICE=CR_ATAPI.SYS /D:MSCD000 /E

        *[/B]           ---> No reset to CD-ROM Drive at boot configration
                This option make invalid that Device Driver reset to CD-ROM
                drive at boot sequence(in CONFIG.SYS).

        * : You can omit this option.



*******************************************************************************
(D)     OS/2 2.1, 2.11, and Warp 3.0 device driver support
*******************************************************************************

1. Supported CD-ROM drive:
        <ATAPI Interface CD-ROM>
        CR-572-B (2x, tray loading type)
        CR-574-B (4x, tray loading type)
        CR-581-x (4x, tray loading type)
        CR-171-x (8x, slim type)
        CR-172-x (20x, slim type)

2. Device Driver name:
        MKEATAPI.ADD (Version 1.12)

3. Driver discription:
        *[/V]           ---> Verbose Mode option
                Displays controller status and drive type during OS/2
                 initialization.

        *[/A:n]         ---> Adapter Number option
                Adapter 0 has default parameters for the primary adapter.
                Adapter 1 has default parameters for the secondary adapter.

        *[/P:nnn]       ---> ATAPI base I/O Port Address(hex) option
                This parameter overrides the default base I/O port address for
                the adapter indecated. The default I/O address for primary is
                (1F0) and for seconday is (170).
                If you will set this parameter, you should set /I: parameter.

        *[/I:xx]        ---> Interrupt number option
                This parameter overrides the default IRQ Number for the adapter
                indecated.The default IRQ level for primary is (14) and for
                secondary is (15).If you will set this parameter, you should
                 set /P: parameter.

        *[/NI]          ---> No Interrupt Mode( Polling Mode ) option
                When you use IDE HDD and ATAPI CD-ROM drive at the same adapter
                (primary or secondary), the MKEATAPI.ADD driver is automatically
                used this mode.

        *[/IOR]         ---> I/O Channel Ready Supported Mode option
                For the adapter with I/O channel ready, the MKEATAPI.ADD driver
                can designate the fastest read mode.

        * : You can omit this option.

Samples:
; scan to primary and secondary adapter.
BASEDEV=MKEATAPI.ADD /V

; scan to secondary adapter with I/O channel ready.
BASEDEV=MKEATAPI.ADD /V /A:1 /IOR

; scan to another adapter(I/O address 1E8  IRQ 11) with I/O channel ready.
BASEDEV=MKEATAPI.ADD /V /P:1E8 /I:11 /IOR



 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  CAUTION:
     OS/2 Warp has ATAPI CD-ROM filter driver(IBMIDECD.FLT). If problems occur
     using the IBMIDECD filter, you fix lines in your OS/2 CONFIG.SYS file has
     to be edited as follows:

       rem BASEDEV=IBMIDECD.FLT

     At the end of the file, add the following statement

       BASEDEV=MKEATAPI.ADD /V

     and copy to root directory on the OS/2 system drive.
     In this time, if the CR-ROM drive is attached as master to primary or
     secondary, you should fix a line in your OS/2 CONFIG.SYS file has to be
     edited as follows:

       BASEDEV=IBM1S506.ADD /A:x /I

     The /A parameter refers to the adapter number that the CD-ROM is attached
     to.The /I parameter indicates that the IBM1S506 driver should not attempt
     to initialize the adapter indicated.

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Trademarks and Copyrights:
        PC-DOS is a trademarks of International Business Machines Corporation.
        MS-DOS is a trademark of Microsoft corporation.
        OS/2 is a trademarks of International Business Machines Corporation.
        Windows 3.1 is a trademark of Microsoft corporation.
        Sound Blaster is a trademark of Creative Labs, Inc.
