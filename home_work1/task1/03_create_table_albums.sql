CREATE TABLE IF NOT EXISTS student16.tb_albums();


ALTER TABLE IF EXISTS student16.tb_albums
    ADD COLUMN IF NOT EXISTS album_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                      VARCHAR,
    ADD COLUMN IF NOT EXISTS artist_id                 SMALLINT,
    ADD COLUMN IF NOT EXISTS year                      SMALLINT,
    ADD COLUMN IF NOT EXISTS genre_id                  SMALLINT

;

COMMENT ON TABLE  student16.tb_albums                             IS 'Таблица с альбомами';
COMMENT ON COLUMN student16.tb_albums.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student16.tb_albums.name                        IS 'Название альбома';
COMMENT ON COLUMN student16.tb_albums.artist_id                   IS 'Идентификатор испольнителя';
COMMENT ON COLUMN student16.tb_albums.year                        IS 'Год выпуска';
COMMENT ON COLUMN student16.tb_albums.genre_id                    IS 'Идентификатор жанра альбома';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_albums''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_albums ADD primary key (album_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_albums''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student16.tb_albums ADD foreign key (artist_id) REFERENCES student16.tb_artists(artist_id);
        ALTER TABLE student16.tb_albums ADD foreign key (genre_id) REFERENCES student16.tb_genres(genre_id);
    END IF;
END ';


