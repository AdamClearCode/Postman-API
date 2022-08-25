# Zapytanie w SQL:

## 1.Wyświetl listę książek
```
SELECT title AS Tytuł FROM books 
```

## 2. Wyświetl książki alfabetycznie
```
SELECT title AS Tytuł FROM books ORDER BY title ASC
```

## 3. Wyświetl tylko wypożyczone książki
```
SELECT title AS Tytuł FROM books WHERE rented=true
```

## 4. Ile jest w tym momencie wypożyczonych książek
```
SELECT COUNT(rented) AS Ilość_książek FROM books WHERE rented=TRUE AND deleted=false
```

## 5. Ile jest książek danego autora
```
SELECT authors.name AS Autor, 
COUNT (books.title) AS Liczba_książek 
FROM authors 
INNER JOIN books ON authors.id =books.author_id 
Group BY authors.id, books.title
```

## 6. Która książka była wypożyczana najwięcej razy 
```
SELECT books.title AS Tytuł, 
COUNT(rentals.book_id) AS Wypożyczenia
FROM books 
INNER JOIN rentals ON books.id = rentals.book_id 
GROUP BY books.title, rentals.book_id 
having count(rentals.book_id) = (select max(Wypożyczenia) from 
(select book_id,count(rentals.book_id) as Wypożyczenia from rentals group by book_id)rentals);
```

## 7. Która książka miała co najmniej 2 wypożyczenia
```
SELECT books.title AS Tytuł, 
COUNT (rentals.book_id) AS Liczba_wypożyczeń 
FROM books 
INNER JOIN rentals ON books.id = rentals.book_id 
GROUP BY books.title, rentals.book_id 
HAVING COUNT (rentals.book_id) >= 2
```