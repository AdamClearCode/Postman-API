/*Która książka miała co najmniej 2 wypożyczenia*/

SELECT books.title AS Tytuł, 
COUNT (rentals.book_id) AS Liczba_wypożyczeń 
FROM books 
INNER JOIN rentals ON books.id = rentals.book_id 
GROUP BY books.title, rentals.book_id 
HAVING COUNT (rentals.book_id) >= 2