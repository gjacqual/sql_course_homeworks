--Задание 5
--Составьте запрос для определения суммы скачиваний книг в жанре “исторический роман”

SELECT 'Исторический роман', SUM(downloads) FROM student16.tb_books
WHERE tb_books.genre_id = (SELECT genre_id FROM student16.tb_genres WHERE name = 'Исторический роман');

