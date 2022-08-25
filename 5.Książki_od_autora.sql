/*Ile jest książek danego autora*/

SELECT authors.name AS Autor, 
COUNT (books.title) AS Liczba_książek 
FROM authors 
INNER JOIN books ON authors.id =books.author_id 
Group BY authors.id, books.title