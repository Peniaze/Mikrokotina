# Projekt do predmetu MPC-NEN

Notes:
>* Prezentácia projektu: 19.4. o 8:00
>* Názov mikrokontroleru: PIC16F917
>* Názov dosky: MECHATRONICS DEMONSTRATION KIT
https://www.microchip.com/en-us/development-tool/DM163029

## Zadanie projektu:

Vytvorenie systému pre reguláciu teploty v skleníku pomocou otvárania okna v závislosti od meranej teploty. Otváranie okna je realizované DC brushed motorom (prípadne krokovým).

Používateľ si môže na začiatku programu navoliť rozsah teplôt pre otváranie okna, ktorý určí minimálnu teplotu (okno zavreté) a maximálnu teplotu (okno naplno otvorené). Komunikácia s poutívateľom prebehne pomocou rozhrania UART.

## Zoznam prác na splnenie:

### Kód:

1. nastavenie UART komunikácie (posielanie stringov, prímanie stringov, prevod stringov na číselnú hodnotu)
2. ovládanie DC/krokového motoru a feedback s momentálnou vzdialenosťou (meranie vzdialenosti prejdenej motorčekom)
3. čítanie presnej hodnoty teploty pomocou tepelného senzoru (prevod na percentuálnu hodnotu v intervale zadaných hodnôť, zobrazenie hodnoty na displeji)
4. Hlavný stavový automat pre riadenie väžby medzi všetkými rozhraniami (inicializácia po power on resete -- uart komunikáciou s počítačom, prepínanie pomocou tlačítka + [debouncer] zobrazenie teploty/percentuálnej hodnoty/vypnutého displeju)

### Rozdelenie:
> 1. Tomáš
> 2. Matej
> 3. Tomáš, Matej
> 4. Peťo, Samo

### Dokumentácia:

Pre dokumentáciu stačí podľa všetkého vytvoriť len jeden PDF so všetkými hovnami, o ktorých sme sa "učili"

V e-learninu pri odovzdávaní je tento zoznam:

> 1. Titulní strana (datum, autoři), obsah, úvod a závěr.
> 2. Definice project charter, včetně zdokumentování požadavků.
> 3. Plán projektu (minimálně WBS a milníkový plán, termíny).
> 4. Popis navrženého systému a jeho funkcionalit.
> 5. Dokumentace dokládající naplnění požadavků (kontrolní plán, výsledky testů či zkoušek)
> 6. Vývojový diagram popisující proces fungování navrženého systému.
> 7. Blokové schéma navrženého systému.
> 8. DFMEA, zaměřit se na chyby/selhání ve vztahu k návrhu.
> 9. Dodržet typografické zásady, formátování textu, jednotný styl napříč zprávou.
> 10. Dodržení obecných zvyklostí, např. číslování obrázků, tabulek, atd.  
> 
> Jeden tým odevzdává jedno PDF, nezapomeňte prosím ve zprávě uvést jména členů týmu. 

Na dokumentácií by som povedal, že sa môžu podieľať všetci v tíme, podľa chuti (je to asi najväčší shit z toho)

Všetko je samozrjeme otvorené hociakým pripomienkam.



# Github systém

Pre pracovanie s kódom je potrebné si najprv normálne založiť projekt v MPLABe. Názov mikrokontroléru je PIC16F917. Po vytvorení treba stiahnuť súbor git_init.bat a spustiť ho v zložke s projektom. (Script inicializuje git repo v už vytvorenom foldri)

Môžete potom robiť normálne na branchi master, prípadne si vytvorte vlastný branch ak budete robiť veľké zmeny v spoločných súboroch.. Najlepšie asi bude, ak si každý akoby vytvorí vlastné súbory a nebude v tom bordel. Ak napriek tomu nastanú merge konflikty tak ich vyriešte lokálne (pullnite zmeny, vyriešte konflikt a pushnite)

Aby sa predošlo zbytočným merge konfliktom tak nepridávajte do projektu súbory, ktoré sú automaticky generované MPLABom. Väčšina by mala byť už napísaná v .gitignore, ale niektoré ďalšie sa možno ešte objavia.

Ak budete mať nejaký problém s gitom tak mi napíšte, aspoň sa niečo nové naučím či co :D