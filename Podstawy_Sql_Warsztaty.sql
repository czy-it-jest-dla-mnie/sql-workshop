/* Stworzenie tabeli Users */

CREATE TABLE Users (
    Id int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int,
    Country varchar(255) 
);

/* Dodanie rekordów do tabeli Users 
Składnia

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

UWAGA - gdy pole oznaczone jako 'PRIMARY KEY' (w naszym przypadku 'Id') skonfigurowane jest
jako autogenerowane ('IDENTITY(1,1)') to nie podajemy go w wartościach przy dodawaniu rekordów

https://www.w3schools.com/sql/sql_insert.asp
*/

INSERT INTO Users
VALUES ('Paluch', 'Filip', 30, 'Italy')

INSERT INTO Users
VALUES ('Krychowski', 'Damian', 31, 'Poland')

INSERT INTO Users
VALUES ('Kowalski', 'Jan', 17, 'Poland')

INSERT INTO Users
VALUES ('Nowak', 'Jan', null, 'Spain')

/* Pobieranie elementów za pomocą komendy SELECT 
Składnia:

SELECT column1, column2, ...
FROM table_name;

https://www.w3schools.com/sql/sql_select.asp
*/
SELECT Id, LastName, FirstName, Age FROM Users

SELECT * FROM Users

SELECT FirstName FROM Users

/* Warunek filtrujący Where 
Składnia:

SELECT column1, column2, ...
FROM table_name
WHERE condition;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

https://www.w3schools.com/sql/sql_where.asp
https://www.w3schools.com/sql/sql_null_values.asp
https://www.w3schools.com/sql/sql_like.asp
https://www.w3schools.com/sql/sql_orderby.asp
*/

SELECT * FROM Users Where Age = 30

SELECT * from Users where Age > 20

SELECT * FROM Users Where LastName = 'Krychowski'

SELECT * FROM Users WHERE Age != 30 AND LastName = 'Krychowski'

SELECT * from Users where Age IS NULL

SELECT * FROM Users Where LastName like('%ski')

SELECT TOP 2 * FROM Users

SELECT * FROM Users order by Age DESC
/*

1. Wypisz wszystkich użytkowników którzy mieszkają w Polsce i są pełnoletni 
2. Wypisz wszystkich użytkowników którzy mieszkają w Polsce lub we Włoszech
3. Wypisz 'Id' wszystkich użytkowników którzy nie mieszkają w Polsce
4. Wypisz najstarszego użytkownika
5. Wypisz wszystkich użytkowników którzy nie mają przypisanego wieku
6. Wypisz użytkowników których imie zaczyna się na literę 'J'

*/

SELECT * FROM Users where Country = 'Poland' AND Age >= 18

SELECT * FROM Users where Country = 'Poland' OR Country = 'Italy'

SELECT Id FROM Users Where Country != 'Poland'

SELECT TOP 1 * FROM Users ORDER BY Age DESC

SELECT * FROM Users Where Age is null

SELECT * FROM Users Where FirstName like('J%')


/* SQL COUNT(), AVG() and SUM()
Składnia:

SELECT COUNT(column_name)
FROM table_name
WHERE condition;

SELECT AVG(column_name)
FROM table_name
WHERE condition;

SELECT SUM(column_name)
FROM table_name
WHERE condition;

https://www.w3schools.com/sql/sql_count_avg_sum.asp

*/

SELECT COUNT(Id) FROM Users 
SELECT COUNT(*) FROM Users

/*

1. Wypisz sumę wieku wszystkich użytkowników
2. Wypisz średnią wieku wszystkich użytkowników
3. Wypisz sumę wieku użytkowników których imie zaczyna się na 'J' lub nazwisko kończy na 'ski'

*/

SELECT SUM(Age) FROM Users

SELECT AVG(Age) FROM Users

SELECT SUM(Age) FROM Users Where FirstName like('J%') OR LastName like('%ski')

/* UPDATE
Składnia:

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

https://www.w3schools.com/sql/sql_update.asp

*/

UPDATE Users 
SET FirstName = 'New Jan',
	Age = 20
WHERE LastName = 'Nowak'

SELECT * FROM Users where LastName = 'Nowak'

/* DELETE
Składnia:

DELETE FROM table_name WHERE condition;

https://www.w3schools.com/sql/sql_delete.asp

*/

DELETE FROM Users Where WHERE LastName = 'Nowak'


/* MIN, MAX
Składnia:

SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

https://www.w3schools.com/sql/sql_min_max.asp
*/

SELECT MAX(Age) FROm Users

SELECT MIN(Age) FROM Users

/*

1. Wypisz jaki jest wiek najstarszego użytkownika mieszkającego w Polsce
2. Wypisz jaki jest najniższy wiek użytkownika który ma w nazwisku literę 'K'

*/

SELECT MAX(Age) from Users where Country = 'Poland'

SELECT MIN(Age) FRom Users Where LastName like ('%K%')

/* Usunięcie bazy danych Users */
DROP DATABASE Users;
