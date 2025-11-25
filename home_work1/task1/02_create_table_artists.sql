CREATE TABLE IF NOT EXISTS student16.tb_artists();


ALTER TABLE IF EXISTS student16.tb_artists
    ADD COLUMN IF NOT EXISTS artist_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student16.tb_artists                            IS 'Таблица с исполнителями';
COMMENT ON COLUMN student16.tb_artists.artist_id                  IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student16.tb_artists.name                       IS 'Имя исполнителя';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_artists''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_artists ADD primary key (artist_id);
    END IF;
END ';

