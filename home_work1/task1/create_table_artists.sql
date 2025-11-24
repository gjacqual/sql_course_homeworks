CREATE TABLE IF NOT EXISTS tb_artists();


ALTER TABLE IF EXISTS tb_artists
    ADD COLUMN IF NOT EXISTS artist_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  tb_artists                            IS 'Таблица с исполнителями';
COMMENT ON COLUMN tb_artists.artist_id                  IS 'Идентификатор исполнителя';
COMMENT ON COLUMN tb_artists.name                       IS 'Имя исполнителя';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_artists''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_artists ADD primary key (artist_id);
    END IF;
END ';

