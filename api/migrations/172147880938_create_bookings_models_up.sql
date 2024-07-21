-- Request
CREATE OR REPLACE FUNCTION request_booking(p_user_id UUID, p_book_id UUID)
RETURNS UUID AS $$
DECLARE
    v_booking_id UUID;
BEGIN
    INSERT INTO bookings (user_id, book_id)
    VALUES (p_user_id, p_book_id)
    RETURNING id INTO v_booking_id;

   RETURN v_booking_id;
END;
$$ LANGUAGE plpgsql;

-- Collection
CREATE OR REPLACE FUNCTION mark_booking_collected(
    p_user_id UUID,
    p_book_id UUID,
    p_booking_id UUID,
    p_return_date TIMESTAMP WITH TIME ZONE
)
RETURNS UUID AS $$
DECLARE
    v_booking_id UUID;
BEGIN
    UPDATE bookings
    SET
        status = 'collected',
        collected_date = CURRENT_TIMESTAMP,
        return_date = p_return_date
    WHERE
        user_id = p_user_id AND book_id = p_book_id AND id = p_booking_id
    RETURNING id INTO v_booking_id;

   	RETURN v_booking_id;
END;
$$ LANGUAGE plpgsql;

-- Return
CREATE OR REPLACE FUNCTION mark_booking_return(
    p_user_id UUID,
    p_book_id UUID,
    p_booking_id UUID
)
RETURNS UUID AS $$
DECLARE
    v_booking_id UUID;
BEGIN
    UPDATE bookings
    SET
        status = 'returned',
        returned_date = CURRENT_TIMESTAMP
    WHERE
        user_id = p_user_id AND book_id = p_book_id AND id = p_booking_id
    RETURNING id INTO v_booking_id;

   	RETURN v_booking_id;
END;
$$ LANGUAGE plpgsql;

-- List of requests
CREATE OR REPLACE FUNCTION get_active_bookings()
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
        b.status != 'returned'
    ORDER BY
        CASE
            WHEN b.status = 'pending' THEN 1
            WHEN b.status = 'collected' THEN 2
            ELSE 3
        END,
        b.updated_at DESC;
END;
$$ LANGUAGE plpgsql;
