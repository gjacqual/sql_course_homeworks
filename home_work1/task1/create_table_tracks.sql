--Ответы на вопросы
--Какие использованы типы связи?
-- Один-ко-многим - жанр к альбомам, артист к альбомам, альбом к трекам.
--Первичные ключи - tb_tracks.id, artist_id, album_id,genre_id
--Внешние ключи - tb_tracks.album_id, tb_albums.artist_id tb_albums.genre_id
--Родительские таблицы - tb_artists, tb_genres - для tb_albums (дочерняя)
-- tb_albums (родительская) для tb_tracks (дочерняя)

CREATE TABLE IF NOT EXISTS tb_tracks();

ALTER TABLE IF EXISTS tb_tracks
    ADD COLUMN IF NOT EXISTS id                         BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS album_id                   SMALLINT,
    ADD COLUMN IF NOT EXISTS duration                   INTERVAL,
    ADD COLUMN IF NOT EXISTS listened                   INT
;

COMMENT ON TABLE  tb_tracks                             IS 'Таблица с музыкальными треками';
COMMENT ON COLUMN tb_tracks.id                          IS 'Идентификатор трека';
COMMENT ON COLUMN tb_tracks.name                        IS 'Имя трека';
COMMENT ON COLUMN tb_tracks.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN tb_tracks.listened                    IS 'Количество прослушиваний';
COMMENT ON COLUMN tb_tracks.duration                    IS 'Продолжительность';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_tracks ADD primary key (id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE tb_tracks ADD foreign key (album_id) REFERENCES tb_albums(album_id);
    END IF;
END ';

