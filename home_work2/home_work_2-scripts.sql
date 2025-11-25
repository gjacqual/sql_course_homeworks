-- Задание 4
-- Составьте запрос для поиска исполнителей, у которых есть треки в жанре “N” (например, рок).

SELECT DISTINCT tb_artists.name FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
WHERE tg.name = 'рок';

-- Задание 5
--Составьте запрос для поиска исполнителей, у которых нет ни одного трека в жанре “M” (например, кантри).

SELECT DISTINCT tb_artists.name FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
WHERE tg.name != 'поп';

-- Задание 6
--Составьте запрос для поиска треков в жанре “Х” (например, электронная) с числом прослушиваний, более 3000.

SELECT name FROM student16.tb_tracks
WHERE tb_tracks.genre_id = (
    SELECT genre_id FROM tb_genres WHERE name = 'электронная'
    ) AND listened > 3000;

-- Задание 7
--Составьте запрос для поиска исполнителей жанра Y (например, рэп), у которых среднее число прослушиваний треков более 20 000 000.

SELECT tb_artists.name, AVG(listened) FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
WHERE tg.name = 'хип-хоп'
GROUP BY tb_artists.name
HAVING AVG(listened) > 20000000;

-- Задание 8
-- Составьте запрос для определения суммы прослушиваний песен в жанре “M”

SELECT SUM(listened) FROM student16.tb_tracks
WHERE tb_tracks.genre_id = (SELECT genre_id FROM tb_genres WHERE name = 'рок');

-- Задание 9
-- Составьте запрос для определения суммы прослушиваний по жанрам, отсортированным по
-- возрастанию количества прослушиваний
SELECT tg.name as genre, SUM(listened) as total_listened FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
GROUP BY genre
ORDER BY total_listened ASC;

-- Задание 10
--Составьте запрос определения среднего числа прослушиваний у исполнителей, отсортированных
--по убыванию количества прослушиваний
SELECT tb_artists.name as artist, AVG(listened) as avg_listened FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
GROUP BY artist
ORDER BY avg_listened DESC;

-- Задание 11
-- Составьте запрос для определения суммы числа прослушиваний по исполнителям,
-- отсортированным по возрастанию числа прослушиваний

SELECT tb_artists.name as artist, SUM(listened) as total_listened FROM student16.tb_artists
    JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id
GROUP BY artist
ORDER BY total_listened ASC;

-- Задание 12
-- Составьте запрос для определения количества песен у каждого исполнителя.

SELECT tb_artists.name AS artist_name, COUNT(tracks.name) AS song_count FROM student16.tb_artists
JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
GROUP BY artist_name
ORDER BY song_count DESC;

-- Задание 13
-- Добавьте в список жанров несколько новых жанров
-- Напишите JOIN запросы для таблиц исполнители и песни: INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER
-- JOIN, FULL JOIN.

INSERT INTO tb_genres (name) VALUES ('trip hop');
INSERT INTO tb_genres (name) VALUES ('trash metal');
INSERT INTO tb_genres (name) VALUES ('city rock');
INSERT INTO tb_genres (name) VALUES ('punk rock');
INSERT INTO tb_genres (name) VALUES ('post punk');

SELECT * FROM student16.tb_genres;

SELECT tb_artists.name AS artist_name, tracks.name  AS track_name FROM student16.tb_artists
INNER JOIN student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        INNER JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
             INNER JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id;

SELECT tb_artists.name AS artist_name, tracks.name AS track_name FROM student16.tb_artists
LEFT OUTER JOIN  student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        LEFT OUTER JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
             LEFT OUTER JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id;

SELECT tb_artists.name AS artist_name, tracks.name AS track_name FROM student16.tb_artists
RIGHT OUTER JOIN  student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        RIGHT OUTER JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
             RIGHT OUTER JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id;

SELECT tb_artists.name AS artist_name, tracks.name AS track_name FROM student16.tb_artists
FULL JOIN  student16.tb_albums ON student16.tb_artists.artist_id = student16.tb_albums.artist_id
        JOIN student16.tb_tracks tracks ON tb_albums.album_id = tracks.album_id
            FULL JOIN student16.tb_genres tg ON tracks.genre_id = tg.genre_id;

-- Задание 14
-- Добавьте в список песню какого-либо исполнителя, заполнив ее жанр значением NULL


INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'I Was Made for Lovin’ You',
        (SELECT album_id FROM tb_albums WHERE name='Love Gun'),
        30000000,
        '00:03:01',
        NULL
);

-- Напишите запрос по выводу списка жанров, для которых нет песен в таблице (с учетом особенностей сравнения с NULL).
SELECT genres.name FROM student16.tb_genres genres
LEFT JOIN student16.tb_tracks tracks ON genres.genre_id = tracks.genre_id
WHERE tracks.id IS NULL;



