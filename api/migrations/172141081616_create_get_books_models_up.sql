CREATE OR REPLACE FUNCTION get_books()
RETURNS TABLE (
    id UUID,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year VARCHAR(255),
    description TEXT,
    cover_image VARCHAR(255),
    genres VARCHAR(255)[],
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.id AS id,
        b.title,
        b.author,
        b.publication_year,
        b.description,
        b.cover_image,
        array_agg(g.name) AS genres,
        b.created_at,
        b.updated_at
    FROM
        books b
    JOIN
        book_genre bg ON b.id = bg.book_id
    JOIN
        genres g ON bg.genre_id = g.id
    GROUP BY
        b.id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_book_by_id(p_book_id UUID)
RETURNS TABLE (
    id UUID,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year VARCHAR(255),
    description TEXT,
    cover_image VARCHAR(255),
    genres VARCHAR(255)[],
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.id AS id,
        b.title,
        b.author,
        b.publication_year,
        b.description,
        b.cover_image,
        array_agg(g.name) AS genres,
        b.created_at,
        b.updated_at
    FROM
        books b
    JOIN
        book_genre bg ON b.id = bg.book_id
    JOIN
        genres g ON bg.genre_id = g.id
    WHERE
        b.id = p_book_id
    GROUP BY
        b.id;
END;
$$ LANGUAGE plpgsql;
