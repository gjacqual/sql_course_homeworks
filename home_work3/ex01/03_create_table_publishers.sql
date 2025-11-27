CREATE TABLE IF NOT EXISTS student16.tb_publishers();


ALTER TABLE IF EXISTS student16.tb_publishers
    ADD COLUMN IF NOT EXISTS publisher_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student16.tb_publishers                               IS 'Таблица с издательствами';
COMMENT ON COLUMN student16.tb_publishers.publisher_id                  IS 'Идентификатор издательства';
COMMENT ON COLUMN student16.tb_publishers.name                          IS 'Название издательства';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_publishers''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_publishers ADD primary key (publisher_id);
    END IF;
END ';

