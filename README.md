## ✈️ Plik `user_fix.dat`

Plik generowany na podstawie punktów VFR obowiązujących w polskiej przestrzeni powietrznej.  
Zawiera poprawki (`FIXES`) w formacie X-Plane 11/12 i służy jako uzupełnienie danych nawigacyjnych w symulatorze.

### 🔧 Format:
- Wersja: `1101 Version`
- Nagłówek dynamiczny: zawiera aktualny cykl AIRAC oraz datę build
- Końcowa linia: `99` jako znacznik końca danych

### 🧠 Pochodzenie danych:
- Punkty pochodzą z oficjalnych publikacji lotniczych (AIP VFR Poland)
- Przetworzone manualnie i zapisane w bazie MariaDB lub plikach `.csv`
- Sortowanie według kodów ICAO i nazw punktów

### 📂 Użycie:
Skopiuj `user_fix.dat` do folderu `X-Plane 12/Custom Data/` aby aktywować własne punkty VFR w X-Plane.

### ⚠️ Zastrzeżenia:
Plik przeznaczony wyłącznie do użytku symulacyjnego.  
Nie należy traktować go jako oficjalnego źródła nawigacyjnego.
## 📄 Licencja

Ten projekt jest dostępny na zasadzie otwartości — możesz z niego korzystać, kopiować, modyfikować i publikować dalej.

Plik `user_fix.dat` służy wyłącznie do symulacji lotniczej i nie stanowi oficjalnego źródła danych dla nawigacji rzeczywistej.

Autor: [Mariusz Migut](mailto:migutmariusz@yahoo.com)






