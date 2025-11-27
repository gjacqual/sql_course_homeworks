--Задание 6
--Составьте запрос для определения суммы скачиваний по жанрам

SELECT  tg.name as genre,  SUM(downloads) total_downloaded FROM student16.tb_books
JOIN student16.tb_genres tg on tg.genre_id = tb_books.genre_id
GROUP BY genre
ORDER BY total_downloaded;

