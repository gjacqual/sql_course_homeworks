--Задание 10
--Добавьте в список жанров несколько новых жанров: детектив, фэнтези, биография
-- Напишите JOIN запросы для таблиц жанры и книги: INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL JOIN.

INSERT INTO student16.tb_genres (name) VALUES ('биография');
INSERT INTO student16.tb_genres (name) VALUES ('детектив');
INSERT INTO student16.tb_genres (name) VALUES ('научная фантастика');

SELECT * FROM student16.tb_books
INNER JOIN student16.tb_genres tg on tg.genre_id = tb_books.genre_id;

SELECT * FROM student16.tb_books
LEFT OUTER JOIN  student16.tb_genres tg on tg.genre_id = tb_books.genre_id;

SELECT * FROM student16.tb_books
RIGHT OUTER JOIN  student16.tb_genres tg on tg.genre_id = tb_books.genre_id;

SELECT * FROM student16.tb_books
FULL JOIN  student16.tb_genres tg on tg.genre_id = tb_books.genre_id;


