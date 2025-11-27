--Наполнение таблиц
--Таблица с жанрами

INSERT INTO student16.tb_genres (name) VALUES ('фантастика');
INSERT INTO student16.tb_genres (name) VALUES ('романы');
INSERT INTO student16.tb_genres (name) VALUES ('психология');
INSERT INTO student16.tb_genres (name) VALUES ('стихи');
INSERT INTO student16.tb_genres (name) VALUES ('фэнтэзи');

--Таблица с авторами
INSERT INTO student16.tb_authors (name)  VALUES ('Пушкин');
INSERT INTO student16.tb_authors (name)  VALUES ('Джоан Роулинг');
INSERT INTO student16.tb_authors (name)  VALUES ('Зигмунд Фрейд');
INSERT INTO student16.tb_authors (name)  VALUES ('Илья Ильф');
INSERT INTO student16.tb_authors (name)  VALUES ('Евгений Петров');
INSERT INTO student16.tb_authors (name)  VALUES ('Лермонтов');


--Таблица с магазинами
INSERT INTO student16.tb_stores (name)  VALUES ('Книжный магазин');
INSERT INTO student16.tb_stores (name)  VALUES ('Библиотека Онлайн');
INSERT INTO student16.tb_stores (name)  VALUES ('Книжный клуб на первой улице');


--Таблица с издательствами
INSERT INTO student16.tb_publishers (name)  VALUES ('Просвящение');
INSERT INTO student16.tb_publishers (name)  VALUES ('СамИздат');
INSERT INTO student16.tb_publishers (name)  VALUES ('Популярная Литература');

--Таблица с книгами
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, price)  VALUES (
        '12 стульев',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='романы'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='СамИздат'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Книжный магазин'),
        505
);

INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, price)  VALUES (
        'Гарри П и Философский камень',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='фэнтэзи'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Популярная Литература'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Книжный клуб на первой улице'),
        505
);

INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, price)  VALUES (
        'Фрейд. Малое собрание сочинений',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='психология'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        505
);

--Таблица связей авторов и книг
INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Илья Ильф'),
            (SELECT book_id FROM student16.tb_books WHERE name='12 стульев')
       ),
        (
            (SELECT author_id FROM student16.tb_authors WHERE name='Евгений Петров'),
            (SELECT book_id FROM student16.tb_books WHERE name='12 стульев')
        )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Джоан Роулинг'),
            (SELECT book_id FROM student16.tb_books WHERE name='Гарри П и Философский камень')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Зигмунд Фрейд'),
            (SELECT book_id FROM student16.tb_books WHERE name='Фрейд. Малое собрание сочинений')
       )
;
