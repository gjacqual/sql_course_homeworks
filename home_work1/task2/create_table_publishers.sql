CREATE TABLE IF NOT EXISTS tb_publishers();


ALTER TABLE IF EXISTS tb_publishers
    ADD COLUMN IF NOT EXISTS publisher_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  tb_publishers                               IS 'Таблица с издательствами';
COMMENT ON COLUMN tb_publishers.publisher_id                  IS 'Идентификатор издательства';
COMMENT ON COLUMN tb_publishers.name                          IS 'Название издательства';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_publishers''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_publishers ADD primary key (publisher_id);
    END IF;
END ';

