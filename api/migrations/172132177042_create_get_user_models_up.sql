CREATE OR REPLACE FUNCTION get_user_by_id(id_param UUID)
RETURNS TABLE (
    id UUID,
    name TEXT,
    email VARCHAR(255),
    avatar VARCHAR(255),
    roles VARCHAR(100)[]
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        u.id AS id,
        u.first_name || ' ' || u.last_name AS name,
        u.email,
        u.avatar,
        array_agg(r.name) AS roles
    FROM
        users u
    JOIN
        user_role ur ON u.id = ur.user_id
    JOIN
        roles r ON ur.role_id = r.id
    WHERE
        u.id = id_param
    GROUP BY
        u.id, u.first_name, u.last_name, u.email, u.avatar;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_user_by_email(email_param TEXT)
RETURNS TABLE (
    id UUID,
    password VARCHAR(255),
    name TEXT,
    email VARCHAR(255),
    avatar VARCHAR(255),
    roles VARCHAR(100)[]
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        u.id AS id,
        u.password,
        u.first_name || ' ' || u.last_name AS name,
        u.email,
        u.avatar,
        array_agg(r.name) AS roles
    FROM
        users u
    JOIN
        user_role ur ON u.id = ur.user_id
    JOIN
        roles r ON ur.role_id = r.id
    WHERE
        u.email = email_param
    GROUP BY
        u.id, u.first_name, u.last_name, u.email, u.avatar;
END;
$$ LANGUAGE plpgsql;
