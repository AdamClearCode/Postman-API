/*Która książka była wypożyczana najwięcej razy*/ 

SELECT books.title AS Tytuł, 
COUNT(rentals.book_id) AS Wypożyczenia
FROM books 
INNER JOIN rentals ON books.id = rentals.book_id 
GROUP BY books.title, rentals.book_id 
having count(rentals.book_id) = (select max(Wypożyczenia) from 
(select book_id,count(rentals.book_id) as Wypożyczenia from rentals group by book_id)rentals);