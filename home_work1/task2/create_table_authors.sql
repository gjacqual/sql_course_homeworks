CREATE TABLE IF NOT EXISTS tb_authors();


ALTER TABLE IF EXISTS tb_authors
    ADD COLUMN IF NOT EXISTS author_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  tb_authors                            IS 'Таблица с авторами';
COMMENT ON COLUMN tb_authors.author_id                  IS 'Идентификатор автора';
COMMENT ON COLUMN tb_authors.name                       IS 'Имя автора';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_authors''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_authors ADD primary key (author_id);
    END IF;
END ';


