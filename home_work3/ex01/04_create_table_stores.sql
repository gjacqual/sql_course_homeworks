CREATE TABLE IF NOT EXISTS student16.tb_stores();


ALTER TABLE IF EXISTS student16.tb_stores
    ADD COLUMN IF NOT EXISTS store_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  student16.tb_stores                               IS 'Таблица с магазинами';
COMMENT ON COLUMN student16.tb_stores.store_id                      IS 'Идентификатор магазина';
COMMENT ON COLUMN student16.tb_stores.name                          IS 'Название магазина';



DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_stores''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_stores ADD primary key (store_id);
    END IF;
END ';

