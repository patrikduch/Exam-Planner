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


# Task

Schéma databáze je zde uvedeno jako referenční z hlediska celkové struktury databáze. Ve schématu databáze je možné provádět dílčí změny a úpravy, nicméně je potřeba je poté zdůvodnit při obhajobě projektu. 

Tabulky Pedagogove, Predmety, Studenti, Vysledky, Mistnosti, Pedagogove_predmety a Studenti_predmety budou v systému pouze jako číselníky. Naplňte si je nějakými zkušebními daty, ale v rámci systému se z nich budou data pouze načítat.

V systému budou rozlišeny 2 uživatelské pohledy - pedagog a student. Nepřihlášený uživatel nebude moci pracovat se systémem!

V databázi bude vloženo min. 5 pedagogů a 5 studentů, kteří budou mít funkční přihlašovací údaje, přiřazené předměty a možnost pracovat se systémem.

Po přihlášení pedagoga bude moci vyučující vytvářet, upravovat nebo mazat termíny zápočtů/zkoušek u předmětů, které vyučuje. U již proběhlých termínů bude moci zadat hodnocení (zadávání hodnocení je nepovinnou funkčností).

Po přihlášení studenta se studentovi zobrazí vypsané termíny pro předměty, které studuje. Student se bude moci zapisovat na termín nebo se z nich odhlašovat.

Vytvořený systém budete prezentovat u zápočtu - buď na svém notebooku nebo dostanete k dispozici jiný počítač, kde bude nainstalováno vše potřebné (PHP, Apache, MySQL).
