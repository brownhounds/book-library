CREATE TABLE books (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year VARCHAR(255),
    description TEXT,
    cover_image VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER updated_at_books BEFORE UPDATE ON books FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TABLE genres (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER updated_at_genres BEFORE UPDATE ON genres FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TABLE book_genre (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    book_id UUID NOT NULL,
    genre_id UUID NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_book_genres_book_id_genre_id ON book_genre (book_id, genre_id);
CREATE TRIGGER updated_at_user_book_genres BEFORE UPDATE ON book_genre FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
