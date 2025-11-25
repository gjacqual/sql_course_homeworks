--Ответы на вопросы
--Какие использованы типы связи?
-- Один-ко-многим - жанр к альбомам, артист к альбомам, альбом к трекам.
--Первичные ключи - tb_tracks.id, artist_id, album_id,genre_id
--Внешние ключи - tb_tracks.album_id, tb_albums.artist_id tb_albums.genre_id
--Родительские таблицы - tb_artists, tb_genres - для tb_albums (дочерняя)
-- tb_albums (родительская) для tb_tracks (дочерняя)

CREATE TABLE IF NOT EXISTS student16.tb_tracks();

ALTER TABLE IF EXISTS student16.tb_tracks
    ADD COLUMN IF NOT EXISTS id                         BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS album_id                   SMALLINT,
    ADD COLUMN IF NOT EXISTS duration                   INTERVAL,
    ADD COLUMN IF NOT EXISTS listened                   INT,
    ADD COLUMN IF NOT EXISTS genre_id                   SMALLINT
;

COMMENT ON TABLE  student16.tb_tracks                             IS 'Таблица с музыкальными треками';
COMMENT ON COLUMN student16.tb_tracks.id                          IS 'Идентификатор трека';
COMMENT ON COLUMN student16.tb_tracks.name                        IS 'Имя трека';
COMMENT ON COLUMN student16.tb_tracks.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student16.tb_tracks.listened                    IS 'Количество прослушиваний';
COMMENT ON COLUMN student16.tb_tracks.duration                    IS 'Продолжительность';
COMMENT ON COLUMN student16.tb_tracks.genre_id                    IS 'Идентификатор жанра трека';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_tracks''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_tracks ADD primary key (id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_tracks''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student16.tb_tracks ADD foreign key (album_id) REFERENCES student16.tb_albums(album_id);
        ALTER TABLE student16.tb_tracks ADD foreign key (genre_id) REFERENCES student16.tb_genres(genre_id);
    END IF;
END ';

