--Задание 7
--Составьте запрос определения среднего числа скачиваний у авторов

SELECT  author.name,  AVG(downloads) avg_downloaded FROM student16.tb_books
JOIN student16.tb_genres tg on tg.genre_id = tb_books.genre_id
JOIN student16.tb_authors_books ON tb_books.book_id = tb_authors_books.book_id
JOIN student16.tb_authors author ON author.author_id = tb_authors_books.author_id
GROUP BY author.name
ORDER BY avg_downloaded;
