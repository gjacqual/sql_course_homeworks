--БД сервиса покупки электронных книг

--Ответы на вопросы
--Какие использованы типы связи?
-- Один-ко-многим - жанр к книгам, изтатель к книгам, магазин к книгам
-- многие-ко-многим для связи книг и авторов. Так как у одного автора может быть несколько книг, и у книг может быть несколько авторов
    -- например Ильф и Петроф "12 стульев"
--Первичные ключи - tb_books.book_id, tb_publishers.publisher_id, tb_genres.genre_id, tb_authors.author_id, tb_stores.store_id,
    -- (author_id, book_id) в таблице tb_authors_books
--Внешние ключи -
-- tb_books.genre_id
--tb_books.publisher_id
--tb_books.store_id
--Родительские таблицы - tb_genres, tb_authors, tb_publishers, tb_stores - содержат первичные ключи,
-- дочерняя таблица tb_books имеет внешнние ключи которые ссылаются на них.


CREATE TABLE IF NOT EXISTS tb_books();

ALTER TABLE IF EXISTS tb_books
    ADD COLUMN IF NOT EXISTS book_id                    BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS year                       SMALLINT,
    ADD COLUMN IF NOT EXISTS genre_id                   SMALLINT,
    ADD COLUMN IF NOT EXISTS publisher_id               SMALLINT,
    ADD COLUMN IF NOT EXISTS store_id                   SMALLINT,
    ADD COLUMN IF NOT EXISTS price                      SMALLINT


;

COMMENT ON TABLE  tb_books                             IS 'Таблица с книгами в сервисе';
COMMENT ON COLUMN tb_books.book_id                     IS 'Идентификатор книги';
COMMENT ON COLUMN tb_books.name                        IS 'Название книги';
COMMENT ON COLUMN tb_books.year                        IS 'Год издания';
COMMENT ON COLUMN tb_books.genre_id                    IS 'Идентификатор жанра книги';
COMMENT ON COLUMN tb_books.publisher_id                IS 'Идентификатор издателя';
COMMENT ON COLUMN tb_books.store_id                    IS 'Идентификатор магазина';
COMMENT ON COLUMN tb_books.price                       IS 'Цена книги';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE tb_books ADD primary key (book_id);
    END IF;
END ';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''public''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE tb_books ADD foreign key (genre_id) REFERENCES tb_genres(genre_id);
        ALTER TABLE tb_books ADD foreign key (publisher_id) REFERENCES tb_publishers(publisher_id);
        ALTER TABLE tb_books ADD foreign key (store_id) REFERENCES tb_stores(store_id);
    END IF;
END ';


