   ** Die Installation des TEAC - Treibers unter DOS **

Um das TEAC CD-ROM Laufwerk zu benutzen,müssen Sie das Laufwerk mit Hilfe
der beiliegenden Installationsdiskette installierer Führen Sie dazu die 
folgenden Schritte durch.

1. Starten Sie Ihr System und legen Sie die Installationsdiskette in das
   Floppy Laufwerk ein.

2. Geben Sie nun auf der DOS Ebene "A:INSATLL" ein und bestätigen dies mit
   ENTER.
   ("A" ist in diesem Fall das Floppy Laufwerk in dem die Installationdiskette
    eingelegt ist.)

3. Das Installationsprogramm wird gestartet.Bitte befolgen Sie nun die 
   Bildschirm anweisungen,um das Installationsprogramm zu vervollständigen.

4. Nach Beendigung des Installationsprogrammes,nehmen Sie bitte die Diskette
   aus dem Laufwerk und starten Ihren Rechner neu.

   Überprüfen Sie bitte,ob während des Bootvorganges folgende Meldung
   zu lesen ist um sicherzugehen,daß das Laufwerk korrekt eingebunden wurde.
 
	MSCDEX Version 2.23
	Copyright(C) Microsoft Corp.1986-1993 Alle Rechte vorbehalten.

		Laufwerk X: = Treiber TEAC-CDI gerät 0

		* "X" ist hierbei der Laufwerksbuchstabe,der dem CD-ROM 
		  Laufwerk zugeordnet wird.Diese Meldung erscheint wenn 
		  das TEAC CD-ROM Laufwerk aktiviert ist.

		** Hiermit ist die Installation des CD-ROM Laufwerkes beended.


  ** Fragen & Antworten bei Problemen **

------------------------------------------------------------------------------
F1: Ihr System bootet nicht und das CD-ROM Laufwerk ist gemeinsam mit Ihrer
    Festplatte an einem Kabel angeschloßen.
------------------------------------------------------------------------------
A: In diesem Fall stellen Sie sicher das die Jumper auf Ihrer Festplatte auf
   MASTER,und die auf Ihrem CD-ROM Laufwerk auf SLAVE gesetzt sind.
   Die Jumper Stellungen Ihres CD-ROM Laufwerkes entnehmen Sie bitte dem 
   beiliegenden Installations-Manual.Bei der Jumper Stellung (MASTER) Ihrer
   Festplatte fragen Sie bitte bei Ihrem Festplatten Hersteller nach.
   ACHTUNG: Es ist möglich das das Laufwerk mit einer Conner Festplatte zusammen
   nicht an einem Kontroller betrieben werden kann (CONNER MODE).

------------------------------------------------------------------------------
F2: Beim Laden des Treibers bleibt Ihr System stehen,ohne irgendeine Meldung
    auf dem Bildschirm.
------------------------------------------------------------------------------
A1:Es ist möglich,daß der TEAC Device Treiber mit anderen Treibern oder
   Kontroller Karten in Konflikt gerät.Bitte überprüfen Sie die Einstellungen
   Ihrer Kontroller Karten und des Device Treibers.
A2:Für den Fall das das CD-ROM Laufwerk in Verbindung mit einem anderen CD-ROM
   Laufwerk (nicht TEAC CD-ROM) im Einsatz ist,überprüfen Sie bitte die 
   jeweiligen Adresseinstellungen Ihrer Kontroller Karten durch Auswahl der
   I/O Ports.

------------------------------------------------------------------------------
F3:Beim Starten Ihres Rechners erscheint die Meldung "Not Install Device Driver".
------------------------------------------------------------------------------
A1:Bitte stellen Sie sicher daß Ihr Stromverbindungskabel und Ihr Datenkabel
   richtig angeschlossen sind.
A2:Bitte stellen Sie sicher daß kein Adress-,oder Interrupt-Konflikt zwischen
   Ihren IDE Kontroller Karten besteht.Achten Sie bitte auf primary,secondary
   und tertiary Einstellungen.
A3:Für den Fall,daß Ihr CD-ROM Laufwerk mit einer Festplatte an einen Kontroller
   angeschlossen ist,so stellen Sie die Jumper auf Ihrer Festplatte auf MASTER,
   und die auf Ihrem CD-ROM Laufwerk auf SLAVE.
   Die Jumper Stellungen Ihres CD-ROM Laufwerkes entnehmen Sie bitte dem
   beiliegenden Installations-Manual.Bei der Jumper Stellung(MASTER) Ihrer 
   Festplatte frahgen Sie bitte bei Ihrem Festplatten Hersteller nach.
A4:Wenn die Adresse Ihres IDE Kontrollers auf Tertiary oder Quaternary gesetzt
   ist,re-installieren Sie die TEAC CD-ROM Software um die richtige Adresse
   zu setzen.Hierbei wählen Sie "SELECT I/O PORT".
A5:Der Einsatz des TEAC CD-ROM Laufwerkes an IDE Kontrollern mit eigenem "CACHE" kann
   zu Problemen führen.

------------------------------------------------------------------------------
F4:Das CD-58E/46E wird vom System nicht erkannt.
------------------------------------------------------------------------------
A: Die Laufwerksbuchstaben in der Config.Sys und Autoexec.Bat stimmen nicht
   überein.Bitte stellen Sie sicher das im Eintrag steht "/D:TEAC-CDI".

------------------------------------------------------------------------------
F5:Das CD-58E/46E wild vom System nicht erkannt und beim Hochstarten errscheint
   die Meldung "Not enough drive letters".
------------------------------------------------------------------------------
A: Es sind möglicherweise nicht ausreichende Laufwerksbuchstaben zugeordnet.
   Bitte fügen Sie in Ihrer Config.Sys in der Zeile "LASTDRIVE" den nächsten
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
A: Bitte überprüfen Sie ob ein Medium eingelegt ist und ob es richtig herum
   im Laufwerk liegt.

------------------------------------------------------------------------------
F7:Auf dem Bildschirm erscheint die Meldung "CDR103: CD-ROM not High Sierra or
   ISO 9660 format".
------------------------------------------------------------------------------
A: Diese Meldung erscheint wenn eine CD eingelegt ist die nicht dem Standard
   entspricht.
   (Beispiel) Sie legen eine Audio CD ein und greifen nicht über den CDPLAYER
	      darauf zu.

------------------------------------------------------------------------------
F8:Das CD-58E/46E wird vom System nicht erkannt wenn Treiber für RAM Boost geladen
   werden.
------------------------------------------------------------------------------
A: Bitte fügen Sie die Zeile mit dem TEAC Treiber in Ihrer Config.Sys vor die 
   Zeilen der RAM Boost Treiber.

------------------------------------------------------------------------------
F9:Benötige ich ein BIOS CMOS Setup für mein IDE CD-ROM ?
------------------------------------------------------------------------------
A: Nein,das CD-ROM wild nicht über das BIOS unterstützt.Es unterscheidet sich von
   den Festplatten.Bitte wählen Sie "non" im BIOS Setup beim CD-ROM I/O port.

------------------------------------------------------------------------------
F10:CD-PLAYER unter Windows arbeitet nicht.
------------------------------------------------------------------------------
A: Um mit dem CD-PLAYER unter Windows arbeiten zu können müßen die entsprechenden
   [MCI]CD Audio-Treiber über die Systemsteuerung geladen sein.
   Bitte schlagen Sie im Windows Handbuch nach,wie man die [MCI]CD Audio-Treiber
   installiert.

------------------------------------------------------------------------------
F11:Wie kann ich Photo-CD's lesen ?
------------------------------------------------------------------------------
A: Sie benötigen die entsprechende Photo CD Software um diese CD's lesen zu
   können.Diese Software können Sie beispielsweise über Kodak,Corel oder Adaptec
   beziehen.

------------------------------------------------------------------------------
F12:Wie kann ich CD-I oder Video CD's abspielen ?
------------------------------------------------------------------------------
A: Sie benötigen eine MPEG-Playback Karte (z.B. RealMagic) um CD-I/Video CD
   /Karaoke CD abspielen zu können.
   Sie können ein Video CD-Verzeichnis lesen,aber kein CD-I Verzeichnis.

------------------------------------------------------------------------------
F13:Ich kann kein CD-I abspielen.
------------------------------------------------------------------------------
A: Es gibt zwei verschiedene Arten von CD's.Eine davon wird CD-I genannt welche
   man in CD-I Abspielgeräten ablaufen lassen kann.Die andere heißt CD-I Digital
   Video und kann in Ihrem CD-ROM Laufwerk mit Hilfe einer MPEG Playback Karte
   abgespielt werden.

------------------------------------------------------------------------------
F14:Kann ich Video CD's Vers.2.0 abspielen ?
------------------------------------------------------------------------------
A: Das ist abhängig von Ihrer MPEG Playback Karte.

------------------------------------------------------------------------------
F15:Arbeitet das CD-ROM Laufwerk mit einem i386 System ?
------------------------------------------------------------------------------
A: Ja,es arbeitet unter einem i386 System,es empfiehlt sich jedoch ein i486 oder
   schnellerer Prozessor einzusetzen.

------------------------------------------------------------------------------
F16:Wie installiere ich Treiber für OS/2 Warp Vers.3.0 ?
------------------------------------------------------------------------------
A: Bitte wählen Sie "nicht aufgeführte" ATAPI Treiber in Ihrem OS/2 Warp
   Vers.3.0 System.

------------------------------------------------------------------------------
F17:Wie installiere ich Treiber für Windows NT/95 ?
------------------------------------------------------------------------------
A: Bitte wählen Sie "nicht aufgeführte" ATAPI Treiber in Ihrem Windows NT/95
   System.


==============================================================================
			Technische Unterstützung
==============================================================================
		TEAC DEUTSCHLAND GMBH
			Tel     0611-71 58 54
			Fax     0611-71 58 66
			BBS     0611-71 58 51
