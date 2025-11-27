--Наполнение таблиц
--Таблица с жанрами

INSERT INTO student16.tb_genres (name) VALUES ('рок');
INSERT INTO student16.tb_genres (name) VALUES ('поп');
INSERT INTO student16.tb_genres (name) VALUES ('классика');
INSERT INTO student16.tb_genres (name) VALUES ('хип-хоп');
INSERT INTO student16.tb_genres (name) VALUES ('фолк');
INSERT INTO student16.tb_genres (name) VALUES ('электронная');

--Таблица с артистами
INSERT INTO student16.tb_artists (name)  VALUES ('KISS');
INSERT INTO student16.tb_artists (name)  VALUES ('Madonna');
INSERT INTO student16.tb_artists (name)  VALUES ('Mozart');
INSERT INTO student16.tb_artists (name)  VALUES ('Eminem');
INSERT INTO student16.tb_artists (name)  VALUES ('Золотое кольцо');
INSERT INTO student16.tb_artists (name)  VALUES ('Daft Punk');

--Таблица с альбомами
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'Love Gun',
        (SELECT artist_id FROM student16.tb_artists WHERE name='KISS'),
        1977,
        (SELECT genre_id FROM student16.tb_genres WHERE name='рок')
);
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'American Life',
        (SELECT artist_id FROM student16.tb_artists WHERE name='Madonna'),
        2003,
        (SELECT genre_id FROM student16.tb_genres WHERE name='поп')
);
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'Classic collection',
        (SELECT artist_id FROM student16.tb_artists WHERE name='Mozart'),
        1995,
        (SELECT genre_id FROM student16.tb_genres WHERE name='классика')
);
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'Infinite',
        (SELECT artist_id FROM student16.tb_artists WHERE name='Eminem'),
        1996,
        (SELECT genre_id FROM student16.tb_genres WHERE name='хип-хоп')
);
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'Течёт ручей',
        (SELECT artist_id FROM student16.tb_artists WHERE name='Золотое кольцо'),
        1996,
        (SELECT genre_id FROM student16.tb_genres WHERE name='фолк')
);
INSERT INTO student16.tb_albums (name, artist_id, year, genre_id)  VALUES (
        'Get Lucky',
        (SELECT artist_id FROM student16.tb_artists WHERE name='Daft Punk'),
        1995,
        (SELECT genre_id FROM student16.tb_genres WHERE name='электронная')
);


--Таблица с музыкальными треками
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Love Gun',
        (SELECT album_id FROM student16.tb_albums WHERE name='Love Gun'),
        11122,
        '00:03:18',
        (SELECT genre_id FROM student16.tb_genres WHERE name='рок')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'I Stole Your Love',
        (SELECT album_id FROM student16.tb_albums WHERE name='Love Gun'),
        2322,
        '00:03:04',
        (SELECT genre_id FROM student16.tb_genres WHERE name='рок')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'American Life song',
        (SELECT album_id FROM student16.tb_albums WHERE name='American Life'),
        2233,
        '00:03:01',
        (SELECT genre_id FROM student16.tb_genres WHERE name='поп')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Instant Crush',
        (SELECT album_id FROM student16.tb_albums WHERE name='Get Lucky'),
        456569,
        '00:05:31',
        (SELECT genre_id FROM student16.tb_genres WHERE name='электронная')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Touch',
        (SELECT album_id FROM student16.tb_albums WHERE name='Get Lucky'),
        1269,
        '00:08:18',
        (SELECT genre_id FROM student16.tb_genres WHERE name='электронная')
);

INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'It’s OK',
        (SELECT album_id FROM student16.tb_albums WHERE name='Infinite'),
        30000000,
        '00:04:01',
        (SELECT genre_id FROM student16.tb_genres WHERE name='хип-хоп')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Backstabber',
        (SELECT album_id FROM student16.tb_albums WHERE name='Infinite'),
        50000011,
        '00:03:24',
        (SELECT genre_id FROM student16.tb_genres WHERE name='хип-хоп')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Infinite',
        (SELECT album_id FROM student16.tb_albums WHERE name='Infinite'),
        15000001,
        '00:04:01',
        (SELECT genre_id FROM student16.tb_genres WHERE name='хип-хоп')
);
INSERT INTO student16.tb_tracks (name, album_id, listened, duration, genre_id)  VALUES (
        'Infinite2',
        (SELECT album_id FROM student16.tb_albums WHERE name='Infinite'),
        49000001,
        '00:04:01',
        (SELECT genre_id FROM student16.tb_genres WHERE name='хип-хоп')
);
