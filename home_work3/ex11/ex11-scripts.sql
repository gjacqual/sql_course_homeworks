--Задание 11
--Добавьте в список книгу:Доктор Живаго

INSERT INTO student16.tb_authors (name)  VALUES ('Борис Пастернак');
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Доктор Живаго',
        1955,
        NULL,
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='СамИздат'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Книжный магазин'),
        660,
        20300,
        1505
);
INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Борис Пастернак'),
            (SELECT book_id FROM student16.tb_books WHERE name='Доктор Живаго')
       )
;

--Напишите запрос по выводу списка жанров книг, для которых нет книг в таблице (с учетом особенностей сравнения с NULL).

SELECT genres.name FROM student16.tb_genres genres
LEFT JOIN student16.tb_books books ON genres.genre_id = books.genre_id
WHERE books.name IS NULL;
