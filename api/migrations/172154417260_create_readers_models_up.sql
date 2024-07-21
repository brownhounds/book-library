CREATE OR REPLACE FUNCTION get_readers()
RETURNS TABLE (
    id UUID,
    name TEXT,
    email VARCHAR(255),
    avatar VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        u.id AS id,
        u.first_name || ' ' || u.last_name AS name,
        u.email,
        u.avatar,
        u.created_at
    FROM
        users u
    WHERE
        u.id NOT IN (
            SELECT ur.user_id
            FROM user_role ur
            JOIN roles r ON ur.role_id = r.id
            WHERE r.name = 'admin'
        )
    GROUP BY
        u.id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_reader_by_id(p_user_id UUID)
RETURNS TABLE (
    id UUID,
    name TEXT,
    email VARCHAR(255),
    avatar VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        u.id AS id,
        u.first_name || ' ' || u.last_name AS name,
        u.email,
        u.avatar,
        u.created_at
    FROM
        users u
    WHERE
        u.id = p_user_id
    GROUP BY
        u.id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_books_by_user_id(p_user_id UUID)
RETURNS TABLE (
    id UUID,
    user_id UUID,
    user_name TEXT,
    book_id UUID,
    book_title VARCHAR(255),
    status bookings_status_enum,
    return_date TIMESTAMP WITH TIME ZONE,
    collected_date TIMESTAMP WITH TIME ZONE,
    returned_date TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.id,
        b.user_id,
        u.first_name || ' ' || u.last_name AS user_name,
        b.book_id,
        bk.title AS book_title,
        b.status,
        b.return_date,
        b.collected_date,
        b.returned_date,
        b.created_at,
        b.updated_at
    FROM
        bookings b
    JOIN
        users u ON b.user_id = u.id
    JOIN
        books bk ON b.book_id = bk.id
    WHERE
        b.status != 'returned' AND b.user_id = p_user_id
    ORDER BY
        CASE
            WHEN b.status = 'collected' THEN 1
            WHEN b.status = 'pending' THEN 2
            ELSE 3
        END,
        b.updated_at DESC;
END;
$$ LANGUAGE plpgsql;
