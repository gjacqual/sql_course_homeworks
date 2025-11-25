CREATE TABLE IF NOT EXISTS tb_stores();


ALTER TABLE IF EXISTS tb_stores
    ADD COLUMN IF NOT EXISTS store_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR
;

COMMENT ON TABLE  tb_stores                               IS 'Таблица с магазинами';
COMMENT ON COLUMN tb_stores.store_id                      IS 'Идентификатор магазина';
COMMENT ON COLUMN tb_stores.name                          IS 'Название магазина';



DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_stores''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_stores ADD primary key (store_id);
    END IF;
END ';

