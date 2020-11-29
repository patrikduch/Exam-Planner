# Dockerization

## Stop docker container

docker stop <containerName>

## Compose docker services

docker-compose up

## Decompose docker services

docker-compose dowm

<hr>

# Nette

### Third-party libraries
Contributte bootstrap 4 forms

<ul>
    https://github.com/contributte/forms-bootstrap
</ul>

# Db preparation

db/procedures = MySQL procedures that encapsulates some advanced SQL commands.

create-db.sql = defines structure of relation database

insert-db.sql = initial data for developed IS


# Support

https://forum.nette.org/cs/32612-redirect-z-formulare-v-komonente
https://doc.nette.org/cs/3.0/components
https://doc.nette.org/cs/3.0/http-request-response
https://api.nette.org/2.3/source-Application.UI.Presenter.php.html#1349-1364
https://forum.nette.org/cs/30471-nette-forms-vlastni-validator-addrule
https://forum.nette.org/cs/29084-po-odeslani-formulare-se-neoveri-shoda-novych-hesel
https://pla.nette.org/cs/validace-prvku-v-zavislosti-na-hodnote-jinych-prvku
https://forum.nette.org/en/24926-url-getqueryparameters-doesn-t-work
https://www.geeksforgeeks.org/comparing-two-dates-in-php/



# Task

Schéma databáze je zde uvedeno jako referenční z hlediska celkové struktury databáze. Ve schématu databáze je možné provádět dílčí změny a úpravy, nicméně je potřeba je poté zdůvodnit při obhajobě projektu. 

Tabulky Pedagogove, Predmety, Studenti, Vysledky, Mistnosti, Pedagogove_predmety a Studenti_predmety budou v systému pouze jako číselníky. Naplňte si je nějakými zkušebními daty, ale v rámci systému se z nich budou data pouze načítat.

V systému budou rozlišeny 2 uživatelské pohledy - pedagog a student. Nepřihlášený uživatel nebude moci pracovat se systémem!

V databázi bude vloženo min. 5 pedagogů a 5 studentů, kteří budou mít funkční přihlašovací údaje, přiřazené předměty a možnost pracovat se systémem.

Po přihlášení pedagoga bude moci vyučující vytvářet, upravovat nebo mazat termíny zápočtů/zkoušek u předmětů, které vyučuje. U již proběhlých termínů bude moci zadat hodnocení (zadávání hodnocení je nepovinnou funkčností).

Po přihlášení studenta se studentovi zobrazí vypsané termíny pro předměty, které studuje. Student se bude moci zapisovat na termín nebo se z nich odhlašovat.

Vytvořený systém budete prezentovat u zápočtu - buď na svém notebooku nebo dostanete k dispozici jiný počítač, kde bude nainstalováno vše potřebné (PHP, Apache, MySQL).
