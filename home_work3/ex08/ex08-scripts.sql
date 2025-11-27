--Задание 8
--Составьте запрос для определения суммы числа скачиваний по авторам

SELECT  author.name,  SUM(downloads) total_downloaded FROM student16.tb_books
JOIN student16.tb_genres tg on tg.genre_id = tb_books.genre_id
JOIN student16.tb_authors_books ON tb_books.book_id = tb_authors_books.book_id
JOIN student16.tb_authors author ON author.author_id = tb_authors_books.author_id
GROUP BY author.name
ORDER BY total_downloaded;
