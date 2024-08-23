#! /bin/bash

#Adres do pobierania wpisany jest od razu.
#
    
## Pobieranie katalogów scenerii.
while read C;
	do
 	wget ftp://ftp.kingmont.com/flightsims/flightgear/Scenery-v2.12/$C;
	#rozszyfrować wszystkie wpisy w katalogu i zapisać do pliku.
	gpg -d --quiet Fiat-Klub-Polska.gpg
	done < spis_katalogow.dat
	
echo "*********** Katalogi scenerii pobrane. *************"
