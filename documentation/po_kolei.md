## Praca ze skryptami.

---

1. Pobieramy dane z [AIP Polska](https://www.ais.pansa.pl/publikacje/aip-polska/)
2. Pobieramy dla każdego lotniska IFR MIL VFR wersję **PDF** gdzie widać jest tabelkę z punktami VFR.
3. Należy przygotować plik z nazwami punktów VFR `mapowanie_vfr.txt`
4. W katalogu **DATA** umieszczamy pliki **PDF** pobrane wcześniej z aip polska. Ja pobierałem partiami najpierw IFR natępnie MIL i na końcu VFR gdyż tam trzeba dużo przeglądać, nie wszystkie lotniska mają punkty.
5. Pliki **PDF** w katalogu **DATA** i odpalamy `vfr_batch_extractor.py` i otrzymujemy plik `punkty_vfr.csv` oraz plik `kontrola.log` z danymi ile w każdym lotnisku jest punktów.
6. Z pliku `punkty_vfr.csv` generujemy skryptem `generate_user_fix.py` plik `user_fix.dat` i umieszczamy go w katalogu `skład/`.
7. I tak kolejno dla MIL i VFR przy czym gdy uzyskamy plik `user_fix.dat` zmieniamy mu nazwę dla MIL `user_fix_mil.dat` dla VFR `user_fix_vfr.dat`
8. Mamy ekstrakt z plików **PDF** przerobiony na format `user_fix.dat` trzy pliki w katalogu `skład/`. Teraz należy je połączyć skryptem napisanym w Pythonie `scal_sortuj_zlicz.py`. Działanie tego skryptu to plik `scalony_user_fix.txt`
9. Przyszedł czas aby dodać nagłówek do pliku i ostatnią linijkę 99. Nagłówek ma aktualny AIRAC i datę aktualizacji. Używamy do tego skryptu `dodaj_naglowek.py` wynikiem czego otrzymujemy plik `user_fix.dat`

Kolejny etap to scalenie wszystkich skryptów w jedną aplikację. 

---

- ## Baza danych.



Teraz czas na dodanie danych do bazy **DataVFR**.

- #### Wgrywanie danych do bazy.

Tabela punkt została dopasowana do `user_fix.dat`.

Należy uruchomić skrypt `user_fix_to_insert.py` i uzyskujemy plik `punkt.sql`.

Dla sprawdzenia można go otworzyć w jakimś edytorze.

Wgrywamy dane do bazy komendą:

`cat punkt.sql | mariadb -u mariusz -p ` 

następnie wpisujemy hasło do bazy ENTER. Jak nie ma errorów w konsoli to mamy dane wgrane.

- #### Pobieramy dane



- #### Aktualizujemy dane

---

- ### Opis bazy danych.


| Field  | Type        | Null | Key | Default | Extra          |
|--------|-------------|------|-----|---------|----------------|
| id     | int(11)     | NO   | PRI | NULL    | auto_increment |
| icao   | varchar(4)  | NO   | UNI | NULL    |                |
| region | varchar(2)  | NO   |     | NULL    |                |
| miasto | varchar(45) | YES  |     | NULL    |                |
| id_typ | int(11)     | YES  | MUL | NULL    |                |
---

| Field       | Type        | Null | Key | Default   | Extra          |
|-------------|-------------|------|-----|-----------|----------------|
| id          | int(11)     | NO   | PRI | NULL      | auto_increment |
| latitude    | double      | NO   |     | NULL      |                |
| longitude   | double      | NO   |     | NULL      |                |
| punkt       | varchar(10) | NO   |     | NULL      |                |
| icao        | varchar(4)  | NO   |     | NULL      |                |
| region      | varchar(2)  | NO   |     | NULL      |                |
| kod         | varchar(10) | YES  |     | NULL      |                |
| nazwa       | varchar(45) | YES  |     | NULL      |                |
| last_edit   | date        | NO   |     | curdate() |                |
| id_lotnisko | int(11)     | YES  | MUL | NULL      |                |
---


| Field | Type        | Null | Key | Default | Extra          |
|-------|-------------|------|-----|---------|----------------|
| id    | int(11)     | NO   | PRI | NULL    | auto_increment |
| typ   | varchar(20) | NO   |     | NULL    |                |
---

CDN .........