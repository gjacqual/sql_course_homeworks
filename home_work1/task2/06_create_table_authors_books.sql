CREATE TABLE IF NOT EXISTS tb_authors_books();


ALTER TABLE IF EXISTS tb_authors_books
    ADD COLUMN IF NOT EXISTS author_id                  SMALLINT,
    ADD COLUMN IF NOT EXISTS book_id                    SMALLINT
;

COMMENT ON TABLE  tb_authors_books                              IS 'Таблица связей книг с авторами';
COMMENT ON COLUMN tb_authors_books.author_id                    IS 'Идентификаторы авторов';
COMMENT ON COLUMN tb_authors_books.book_id                      IS 'Идентификаторы книг';


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
        ALTER TABLE tb_authors_books ADD primary key (author_id, book_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_authors_books''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE tb_authors_books ADD foreign key (author_id) REFERENCES tb_authors(author_id);
        ALTER TABLE tb_authors_books ADD foreign key (book_id) REFERENCES tb_books(book_id);
    END IF;
END ';
