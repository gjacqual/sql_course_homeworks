-- Задание 2
-- Для таблицы со список книг добавьте разделы партиционирования методом Range по количеству скачиваний:
-- P1: число скачиваний меньше 1000
-- P2: число скачиваний больше или равно 1000 и меньше 10000
-- P3: число скачиваний больше или равно 10000
-- Добавьте в отчет результаты выполнения запросов (например, скрин схемы БД).

DROP TABLE IF EXISTS student16.tb_books CASCADE ;
DROP TABLE IF EXISTS student16.p1 CASCADE ;
DROP TABLE IF EXISTS student16.p2 CASCADE ;
DROP TABLE IF EXISTS student16.p3 CASCADE ;

CREATE TABLE IF NOT EXISTS student16.tb_books(
    book_id                    BIGSERIAL,
    name                       VARCHAR,
    year                       SMALLINT,
    genre_id                   SMALLINT,
    publisher_id               SMALLINT,
    store_id                   SMALLINT,
    pages                   SMALLINT,
    downloads                  INT,
    price                      SMALLINT
) PARTITION BY RANGE(downloads);

COMMENT ON TABLE  student16.tb_books                             IS 'Таблица с книгами в сервисе';
COMMENT ON COLUMN student16.tb_books.book_id                     IS 'Идентификатор книги';
COMMENT ON COLUMN student16.tb_books.name                        IS 'Название книги';
COMMENT ON COLUMN student16.tb_books.year                        IS 'Год издания';
COMMENT ON COLUMN student16.tb_books.genre_id                    IS 'Идентификатор жанра книги';
COMMENT ON COLUMN student16.tb_books.publisher_id                IS 'Идентификатор издателя';
COMMENT ON COLUMN student16.tb_books.store_id                    IS 'Идентификатор магазина';
COMMENT ON COLUMN student16.tb_books.pages                       IS 'Страниц';
COMMENT ON COLUMN student16.tb_books.downloads                   IS 'Скачиваний';
COMMENT ON COLUMN student16.tb_books.price                       IS 'Цена книги';


DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''student16.tb_books''
              and lower(table_schema) = ''student16''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student16.tb_books ADD foreign key (genre_id) REFERENCES student16.tb_genres(genre_id);
        ALTER TABLE student16.tb_books ADD foreign key (publisher_id) REFERENCES student16.tb_publishers(publisher_id);
        ALTER TABLE student16.tb_books ADD foreign key (store_id) REFERENCES student16.tb_stores(store_id);
    END IF;
END ';

-- Создание отдельных партиций P1, P2, P3
CREATE TABLE tb_books_p1 PARTITION OF student16.tb_books FOR VALUES FROM (MINVALUE) TO (1000);
CREATE TABLE tb_books_p2 PARTITION OF student16.tb_books FOR VALUES FROM (1000) TO (10000);
CREATE TABLE tb_books_p3 PARTITION OF student16.tb_books FOR VALUES FROM (10000) TO (MAXVALUE);





