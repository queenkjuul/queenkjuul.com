   ** Die Installation des TEAC - Treibers unter DOS **

Um das TEAC CD-ROM Laufwerk zu benutzen,m�ssen Sie das Laufwerk mit Hilfe
der beiliegenden Installationsdiskette installierer F�hren Sie dazu die 
folgenden Schritte durch.

1. Starten Sie Ihr System und legen Sie die Installationsdiskette in das
   Floppy Laufwerk ein.

2. Geben Sie nun auf der DOS Ebene "A:INSATLL" ein und best�tigen dies mit
   ENTER.
   ("A" ist in diesem Fall das Floppy Laufwerk in dem die Installationdiskette
    eingelegt ist.)

3. Das Installationsprogramm wird gestartet.Bitte befolgen Sie nun die 
   Bildschirm anweisungen,um das Installationsprogramm zu vervollst�ndigen.

4. Nach Beendigung des Installationsprogrammes,nehmen Sie bitte die Diskette
   aus dem Laufwerk und starten Ihren Rechner neu.

   �berpr�fen Sie bitte,ob w�hrend des Bootvorganges folgende Meldung
   zu lesen ist um sicherzugehen,da� das Laufwerk korrekt eingebunden wurde.
 
	MSCDEX Version 2.23
	Copyright(C) Microsoft Corp.1986-1993 Alle Rechte vorbehalten.

		Laufwerk X: = Treiber TEAC-CDI ger�t 0

		* "X" ist hierbei der Laufwerksbuchstabe,der dem CD-ROM 
		  Laufwerk zugeordnet wird.Diese Meldung erscheint wenn 
		  das TEAC CD-ROM Laufwerk aktiviert ist.

		** Hiermit ist die Installation des CD-ROM Laufwerkes beended.


  ** Fragen & Antworten bei Problemen **

------------------------------------------------------------------------------
F1: Ihr System bootet nicht und das CD-ROM Laufwerk ist gemeinsam mit Ihrer
    Festplatte an einem Kabel angeschlo�en.
------------------------------------------------------------------------------
A: In diesem Fall stellen Sie sicher das die Jumper auf Ihrer Festplatte auf
   MASTER,und die auf Ihrem CD-ROM Laufwerk auf SLAVE gesetzt sind.
   Die Jumper Stellungen Ihres CD-ROM Laufwerkes entnehmen Sie bitte dem 
   beiliegenden Installations-Manual.Bei der Jumper Stellung (MASTER) Ihrer
   Festplatte fragen Sie bitte bei Ihrem Festplatten Hersteller nach.
   ACHTUNG: Es ist m�glich das das Laufwerk mit einer Conner Festplatte zusammen
   nicht an einem Kontroller betrieben werden kann (CONNER MODE).

------------------------------------------------------------------------------
F2: Beim Laden des Treibers bleibt Ihr System stehen,ohne irgendeine Meldung
    auf dem Bildschirm.
------------------------------------------------------------------------------
A1:Es ist m�glich,da� der TEAC Device Treiber mit anderen Treibern oder
   Kontroller Karten in Konflikt ger�t.Bitte �berpr�fen Sie die Einstellungen
   Ihrer Kontroller Karten und des Device Treibers.
A2:F�r den Fall das das CD-ROM Laufwerk in Verbindung mit einem anderen CD-ROM
   Laufwerk (nicht TEAC CD-ROM) im Einsatz ist,�berpr�fen Sie bitte die 
   jeweiligen Adresseinstellungen Ihrer Kontroller Karten durch Auswahl der
   I/O Ports.

------------------------------------------------------------------------------
F3:Beim Starten Ihres Rechners erscheint die Meldung "Not Install Device Driver".
------------------------------------------------------------------------------
A1:Bitte stellen Sie sicher da� Ihr Stromverbindungskabel und Ihr Datenkabel
   richtig angeschlossen sind.
A2:Bitte stellen Sie sicher da� kein Adress-,oder Interrupt-Konflikt zwischen
   Ihren IDE Kontroller Karten besteht.Achten Sie bitte auf primary,secondary
   und tertiary Einstellungen.
A3:F�r den Fall,da� Ihr CD-ROM Laufwerk mit einer Festplatte an einen Kontroller
   angeschlossen ist,so stellen Sie die Jumper auf Ihrer Festplatte auf MASTER,
   und die auf Ihrem CD-ROM Laufwerk auf SLAVE.
   Die Jumper Stellungen Ihres CD-ROM Laufwerkes entnehmen Sie bitte dem
   beiliegenden Installations-Manual.Bei der Jumper Stellung(MASTER) Ihrer 
   Festplatte frahgen Sie bitte bei Ihrem Festplatten Hersteller nach.
A4:Wenn die Adresse Ihres IDE Kontrollers auf Tertiary oder Quaternary gesetzt
   ist,re-installieren Sie die TEAC CD-ROM Software um die richtige Adresse
   zu setzen.Hierbei w�hlen Sie "SELECT I/O PORT".
A5:Der Einsatz des TEAC CD-ROM Laufwerkes an IDE Kontrollern mit eigenem "CACHE" kann
   zu Problemen f�hren.

------------------------------------------------------------------------------
F4:Das CD-58E/46E wird vom System nicht erkannt.
------------------------------------------------------------------------------
A: Die Laufwerksbuchstaben in der Config.Sys und Autoexec.Bat stimmen nicht
   �berein.Bitte stellen Sie sicher das im Eintrag steht "/D:TEAC-CDI".

------------------------------------------------------------------------------
F5:Das CD-58E/46E wild vom System nicht erkannt und beim Hochstarten errscheint
   die Meldung "Not enough drive letters".
------------------------------------------------------------------------------
A: Es sind m�glicherweise nicht ausreichende Laufwerksbuchstaben zugeordnet.
   Bitte f�gen Sie in Ihrer Config.Sys in der Zeile "LASTDRIVE" den n�chsten
   Laufwerksbuchstaben hinzu.

	(Beispiel)
		Bischer                 Neu
		A:FDD                   A:FDD
		B:FDD                   B:FDD
		C:HDD                   C:HDD
		D:HDD                   D:HDD
					E:CD-ROM -> "LASTDRIVE=E"

------------------------------------------------------------------------------
F6:Auf dem Bildschirm erscheint die Meldung "CDR101: Not Ready".
------------------------------------------------------------------------------
A: Bitte �berpr�fen Sie ob ein Medium eingelegt ist und ob es richtig herum
   im Laufwerk liegt.

------------------------------------------------------------------------------
F7:Auf dem Bildschirm erscheint die Meldung "CDR103: CD-ROM not High Sierra or
   ISO 9660 format".
------------------------------------------------------------------------------
A: Diese Meldung erscheint wenn eine CD eingelegt ist die nicht dem Standard
   entspricht.
   (Beispiel) Sie legen eine Audio CD ein und greifen nicht �ber den CDPLAYER
	      darauf zu.

------------------------------------------------------------------------------
F8:Das CD-58E/46E wird vom System nicht erkannt wenn Treiber f�r RAM Boost geladen
   werden.
------------------------------------------------------------------------------
A: Bitte f�gen Sie die Zeile mit dem TEAC Treiber in Ihrer Config.Sys vor die 
   Zeilen der RAM Boost Treiber.

------------------------------------------------------------------------------
F9:Ben�tige ich ein BIOS CMOS Setup f�r mein IDE CD-ROM ?
------------------------------------------------------------------------------
A: Nein,das CD-ROM wild nicht �ber das BIOS unterst�tzt.Es unterscheidet sich von
   den Festplatten.Bitte w�hlen Sie "non" im BIOS Setup beim CD-ROM I/O port.

------------------------------------------------------------------------------
F10:CD-PLAYER unter Windows arbeitet nicht.
------------------------------------------------------------------------------
A: Um mit dem CD-PLAYER unter Windows arbeiten zu k�nnen m��en die entsprechenden
   [MCI]CD Audio-Treiber �ber die Systemsteuerung geladen sein.
   Bitte schlagen Sie im Windows Handbuch nach,wie man die [MCI]CD Audio-Treiber
   installiert.

------------------------------------------------------------------------------
F11:Wie kann ich Photo-CD's lesen ?
------------------------------------------------------------------------------
A: Sie ben�tigen die entsprechende Photo CD Software um diese CD's lesen zu
   k�nnen.Diese Software k�nnen Sie beispielsweise �ber Kodak,Corel oder Adaptec
   beziehen.

------------------------------------------------------------------------------
F12:Wie kann ich CD-I oder Video CD's abspielen ?
------------------------------------------------------------------------------
A: Sie ben�tigen eine MPEG-Playback Karte (z.B. RealMagic) um CD-I/Video CD
   /Karaoke CD abspielen zu k�nnen.
   Sie k�nnen ein Video CD-Verzeichnis lesen,aber kein CD-I Verzeichnis.

------------------------------------------------------------------------------
F13:Ich kann kein CD-I abspielen.
------------------------------------------------------------------------------
A: Es gibt zwei verschiedene Arten von CD's.Eine davon wird CD-I genannt welche
   man in CD-I Abspielger�ten ablaufen lassen kann.Die andere hei�t CD-I Digital
   Video und kann in Ihrem CD-ROM Laufwerk mit Hilfe einer MPEG Playback Karte
   abgespielt werden.

------------------------------------------------------------------------------
F14:Kann ich Video CD's Vers.2.0 abspielen ?
------------------------------------------------------------------------------
A: Das ist abh�ngig von Ihrer MPEG Playback Karte.

------------------------------------------------------------------------------
F15:Arbeitet das CD-ROM Laufwerk mit einem i386 System ?
------------------------------------------------------------------------------
A: Ja,es arbeitet unter einem i386 System,es empfiehlt sich jedoch ein i486 oder
   schnellerer Prozessor einzusetzen.

------------------------------------------------------------------------------
F16:Wie installiere ich Treiber f�r OS/2 Warp Vers.3.0 ?
------------------------------------------------------------------------------
A: Bitte w�hlen Sie "nicht aufgef�hrte" ATAPI Treiber in Ihrem OS/2 Warp
   Vers.3.0 System.

------------------------------------------------------------------------------
F17:Wie installiere ich Treiber f�r Windows NT/95 ?
------------------------------------------------------------------------------
A: Bitte w�hlen Sie "nicht aufgef�hrte" ATAPI Treiber in Ihrem Windows NT/95
   System.


==============================================================================
			Technische Unterst�tzung
==============================================================================
		TEAC DEUTSCHLAND GMBH
			Tel     0611-71 58 54
			Fax     0611-71 58 66
			BBS     0611-71 58 51
