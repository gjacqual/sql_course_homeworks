-- Задание 3
-- Напишите запросы для наполнения БД. Выполните запросы на учебной схеме БД.
-- Добавьте в отчет результат выполнения запросов – скрины заполненных таблиц, результаты вызова к партициям.

--Наполнение таблиц
--Таблица с жанрами

INSERT INTO student16.tb_genres (name) VALUES ('фантастика');
INSERT INTO student16.tb_genres (name) VALUES ('романы');
INSERT INTO student16.tb_genres (name) VALUES ('психология');
INSERT INTO student16.tb_genres (name) VALUES ('стихи');
INSERT INTO student16.tb_genres (name) VALUES ('фэнтэзи');
INSERT INTO student16.tb_genres (name) VALUES ('Non-fiction');
INSERT INTO student16.tb_genres (name) VALUES ('Исторический роман');

--Таблица с авторами
INSERT INTO student16.tb_authors (name)  VALUES ('Пушкин');
INSERT INTO student16.tb_authors (name)  VALUES ('Джоан Роулинг');
INSERT INTO student16.tb_authors (name)  VALUES ('Зигмунд Фрейд');
INSERT INTO student16.tb_authors (name)  VALUES ('Илья Ильф');

INSERT INTO student16.tb_authors (name)  VALUES ('Евгений Петров');
INSERT INTO student16.tb_authors (name)  VALUES ('Лермонтов');
INSERT INTO student16.tb_authors (name)  VALUES ('Митио Каку');
INSERT INTO student16.tb_authors (name)  VALUES ('Ричард Докинз');
INSERT INTO student16.tb_authors (name)  VALUES ('Ричард Фейнман');
INSERT INTO student16.tb_authors (name)  VALUES ('Юрий Тынянов');
INSERT INTO student16.tb_authors (name)  VALUES ('Аркадий и Борис Стругацкие');


--Таблица с магазинами
INSERT INTO student16.tb_stores (name)  VALUES ('Книжный магазин');
INSERT INTO student16.tb_stores (name)  VALUES ('Библиотека Онлайн');
INSERT INTO student16.tb_stores (name)  VALUES ('Книжный клуб на первой улице');


--Таблица с издательствами
INSERT INTO student16.tb_publishers (name)  VALUES ('Просвящение');
INSERT INTO student16.tb_publishers (name)  VALUES ('СамИздат');
INSERT INTO student16.tb_publishers (name)  VALUES ('Популярная Литература');

--Таблица с книгами
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        '12 стульев',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='романы'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='СамИздат'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Книжный магазин'),
        300,
        1670,
        505
);

INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Гарри П и Философский камень',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='фэнтэзи'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Популярная Литература'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Книжный клуб на первой улице'),
        400,
        15499,
        505
);

INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Фрейд. Малое собрание сочинений',
        2005,
        (SELECT genre_id FROM student16.tb_genres WHERE name='психология'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        400,
        999,
        505
);

INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Физика невозможного',
        2008,
        (SELECT genre_id FROM student16.tb_genres WHERE name='Non-fiction'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        460,
        2000,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Эгоистичный ген',
        1989,
        (SELECT genre_id FROM student16.tb_genres WHERE name='Non-fiction'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        610,
        400,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Вы, конечно, шутите, мистер Фейнман!',
        1985,
        (SELECT genre_id FROM student16.tb_genres WHERE name='Non-fiction'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        450,
        1000,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Кюхля',
        1925,
        (SELECT genre_id FROM student16.tb_genres WHERE name='Исторический роман'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        350,
        2300,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'За миллиард лет до конца света',
        1977,
        (SELECT genre_id FROM student16.tb_genres WHERE name='фантастика'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        150,
        20000,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Понедельник начинается в субботу',
        1964,
        (SELECT genre_id FROM student16.tb_genres WHERE name='фантастика'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        250,
        21000,
        505
);
INSERT INTO student16.tb_books (name, year, genre_id, publisher_id, store_id, pages, downloads, price)  VALUES (
        'Уравнение Бога. В поисках теории всего',
        2021,
        (SELECT genre_id FROM student16.tb_genres WHERE name='Non-fiction'),
        (SELECT publisher_id FROM student16.tb_publishers WHERE name='Просвящение'),
        (SELECT store_id FROM student16.tb_stores WHERE name='Библиотека Онлайн'),
        200,
        1700,
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

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Митио Каку'),
            (SELECT book_id FROM student16.tb_books WHERE name='Физика невозможного')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Ричард Докинз'),
            (SELECT book_id FROM student16.tb_books WHERE name='Эгоистичный ген')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Ричард Фейнман'),
            (SELECT book_id FROM student16.tb_books WHERE name='Вы, конечно, шутите, мистер Фейнман!')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Юрий Тынянов'),
            (SELECT book_id FROM student16.tb_books WHERE name='Кюхля')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Аркадий и Борис Стругацкие'),
            (SELECT book_id FROM student16.tb_books WHERE name='За миллиард лет до конца света')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Аркадий и Борис Стругацкие'),
            (SELECT book_id FROM student16.tb_books WHERE name='Понедельник начинается в субботу')
       )
;

INSERT INTO student16.tb_authors_books (author_id, book_id)
VALUES (
            (SELECT author_id FROM student16.tb_authors WHERE name='Митио Каку'),
            (SELECT book_id FROM student16.tb_books WHERE name='Уравнение Бога. В поисках теории всего')
       )
;

--Выбрать все книги всех авторов
select tb_books.name book_name, tb_authors.name author, year, pages, tb_genres.name genre, downloads from student16.tb_books
JOIN tb_genres ON tb_books.genre_id = tb_genres.genre_id
JOIN student16.tb_authors_books ON tb_books.book_id = tb_authors_books.book_id
JOIN student16.tb_authors ON tb_authors.author_id = tb_authors_books.author_id;

--Вызываем записи в партиции
--Напишите запросы, чтобы проверить: какие книги находятся в партициях p1, p2, p3.
SELECT * FROM tb_books_p1;
SELECT * FROM tb_books_p2;
SELECT * FROM tb_books_p3;


