/*Ile jest w tym momencie wypożyczonych książek*/

SELECT COUNT(rented) AS Ilość_książek FROM books WHERE rented=TRUE AND deleted=false