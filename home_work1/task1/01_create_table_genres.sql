CREATE TABLE IF NOT EXISTS student16.tb_genres();


ALTER TABLE IF EXISTS student16.tb_genres
    ADD COLUMN IF NOT EXISTS genre_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student16.tb_genres                               IS 'Таблица с жанрами музыки';
COMMENT ON COLUMN student16.tb_genres.genre_id                      IS 'Идентификатор жанра';
COMMENT ON COLUMN student16.tb_genres.name                          IS 'Имя жанра';



DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_genres''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_genres ADD primary key (genre_id);
    END IF;
END ';

