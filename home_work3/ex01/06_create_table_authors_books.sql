CREATE TABLE IF NOT EXISTS student16.tb_authors_books();


ALTER TABLE IF EXISTS student16.tb_authors_books
    ADD COLUMN IF NOT EXISTS author_id                  SMALLINT,
    ADD COLUMN IF NOT EXISTS book_id                    SMALLINT
;

COMMENT ON TABLE  student16.tb_authors_books                              IS 'Таблица связей книг с авторами';
COMMENT ON COLUMN student16.tb_authors_books.author_id                    IS 'Идентификаторы авторов';
COMMENT ON COLUMN student16.tb_authors_books.book_id                      IS 'Идентификаторы книг';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_authors''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student16.tb_authors_books ADD primary key (author_id, book_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_authors_books''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student16.tb_authors_books ADD foreign key (author_id) REFERENCES student16.tb_authors(author_id);
ALTER TABLE student16.tb_authors_books ADD foreign key (book_id) REFERENCES student16.tb_books(book_id);
    END IF;
END ';
