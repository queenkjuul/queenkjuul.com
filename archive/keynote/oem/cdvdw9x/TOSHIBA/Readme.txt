This manual describes how to setup the device driver of TOSHIBA ATAPI
CD/DVD-ROM Drive.
This device driver is exclusive use of following TOSHIBA ATAPI CD/DVD-ROM
drives.
  XM-5602B, XM-5702B, XM-6002B, XM-6102B, XM-6202B, XM-6302B
  XM-1502B, XM-1602B, XM-2402B, XM-1702B, XM-1802B
  SD-M1002, SD-M1102, SD-M1202


How to setup the CD-ROM device driver.

1. Copy CD/DVD-ROM device driver to the system disk.

2. Add the following line to CONFIG.SYS of the system disk.
        LASTDRIVE=Z
        DEVICE=<drive>:<path>\CDROMDRV.SYS <option switch>

    ¥ Option switch
        /D:<device name>     Specifying the device name.
                             Must match the device name of MSCDEX.EXE.

        /C:<turn stop time>  Specifying the duration time which stops the
                             drive motor when not using CD/DVD-ROM drive.
                             The following value can be specified.
                                   /C:1      125 ms
                                   /C:2      250 ms
                                   /C:3      500 ms
                                   /C:4        1 s
                                   /C:5        2 s
                                   /C:6        4 s
                                   /C:7        8 s
                                   /C:8       16 s
                                   /C:9       32 s
                                   /C:A        1 min
                                   /C:B        2 min
                                   /C:C        4 min
                                   /C:D        8 min
                                   /C:E       16 min
                                   /C:F       32 min

        /V                   Display the detailed information on power up.

        /E                   Driver runs with the highest PIO mode by detecting
                             PIO capability of CD/DVD-ROM drive.
                             Use "/PIO" option when specifying PIO mode
                             directly.

        /PIO:<pio_mode>      Specifying PIO mode. Driver runs by using
                             specified PIO mode.
                             The capable specifying of PIO mode(pio_mode) is
                             0-4. Specification of PIO mode is not capable,
                             when specifying PIO mode which is not supported
                             by CD/DVD-ROM drive.

        /B                   Driver enables the DMA transfer.
                             When specifying this option, the driver runs with
                             the highest DMA mode by detecting DMA capability
                             of CD/DVD-ROM drive.
                             Use "/DMA" option when specifying DMA mode
                             directly.

        /DMA:<Mdma_mode>     Driver enables the DMA transfer.
                             When specifying this option the driver runs using
                             specified DMA mode. The capable specifying range
                             of DMA mode(Mdma_mode) is M0-M2. DMA transfer is
                             not capable, when specified DMA mode which is not
                             supported by CD/DVD-ROM drive.

        /MAX                 Driver runs with the highest PIO/DMA mode by
                             detecting PIO/DMA capability.

        /P:<Port,IRQ,[Device]>
                             Specifying Port, IRQ and Device(Master or Slave)
                             that connect with CD/DVD-ROM drives. Device driver
                             detects drives only against specified Port, IRQ
                             and Device.
                             Specify in Hex each to Port and IRQ, and either
                             Master(M) or Slave(S) to Device.
                             Device can be eliminated, and when eliminated,
                             driver detects both Master and Slave of drive.
                             
                             [Ex: Detects drive only Secondary-Master]
                               DEVICE=CDROMDRV.SYS /D:CDROM001 /P:170,0F,M
                             [Ex: Detects drives only Primary port]
                               DEVICE=CDROMDRV.SYS /D:CDROM001 /P:1F0,0E

        [For example]
        Copying device driver to C:\CDROM, specifying TOSCD001 in the device
        name and specifying 1 minute in the turn stop time.
                DEVICE=C:\CDROM\CDROMDRV.SYS /D:TOSCD001 /C:A

3. Add the following line to AUTOEXEC.BAT.
        C:\DOS\MSCDEX.EXE /D:<device name>

4. Restart computer.


Note:

1. The following is the restrictive item for (/B) (/DMA) option switch.
  (1) Driver supports DMA transfer only when Intel Triton and Triton2 PCI Chip
      Set.
  (2) When application buffer address (store CD/DVD-ROM data) is not word
      align, the driver will not DMA trnasfer. (Use PIO transfer)
  (3) When doing DMA transfer with Intel Triton2 PCI chip set, use EMM386.EXE
      version is more than 4.49.
      (EMM386.EXE Version4.49 should be in MS-DOS 6.22.)
  (4) When DMA transfering, load EMM386.EXE before this device driver is
      loaded into system.

2. Port and IRQ used by this driver often can not run successfully when
   conflicting with the drives (and drivers) of other companies.
