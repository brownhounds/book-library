-- There are better ways o managing seed data
-- This is handled in main api migrations for simplicity

-- Add fake readers
DO $$
DECLARE
    user_id UUID;
    reader_role_id UUID;
BEGIN
    SELECT id INTO reader_role_id FROM roles WHERE name = 'reader';

    FOR i IN 1..5 LOOP
        DECLARE
            first_name VARCHAR(255);
            last_name VARCHAR(255);
            password VARCHAR(255);
            email VARCHAR(255);
            avatar VARCHAR(255);
        BEGIN
            CASE i
                WHEN 1 THEN
                    first_name := 'Emily';
                    last_name := 'Johnson';
                    password := '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6';
                    email := 'emily.johnson@test.com';
                    avatar := 'https://mighty.tools/mockmind-api/content/human/64.jpg';
                WHEN 2 THEN
                    first_name := 'Michael';
                    last_name := 'Brown';
                    password := '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6';
                    email := 'michael.brown@test.com';
                    avatar := 'https://mighty.tools/mockmind-api/content/human/65.jpg';
                WHEN 3 THEN
                    first_name := 'Olivia';
                    last_name := 'Davis';
                    password := '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6';
                    email := 'olivia.davis@test.com';
                    avatar := 'https://mighty.tools/mockmind-api/content/human/1.jpg';
                WHEN 4 THEN
                    first_name := 'Ethan';
                    last_name := 'Wilson';
                    password := '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6';
                    email := 'ethan.wilson@test.com';
                    avatar := 'https://mighty.tools/mockmind-api/content/human/2.jpg';
                WHEN 5 THEN
                    first_name := 'Sophia';
                    last_name := 'Martinez';
                    password := '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6';
                    email := 'sophia.martinez@test.com';
                    avatar := 'https://mighty.tools/mockmind-api/content/human/6.jpg';
            END CASE;

            -- Insert user and retrieve user_id
            INSERT INTO users (first_name, last_name, password, email, avatar)
            VALUES (first_name, last_name, password, email, avatar)
            RETURNING id INTO user_id;

            -- Insert into user_role table
            INSERT INTO user_role (user_id, role_id)
            VALUES (user_id, reader_role_id);
        END;
    END LOOP;
END $$;

-- Add fake admin
DO $$
DECLARE
    user_id UUID;
    admin_role_id UUID;
    reader_role_id UUID;
BEGIN
    SELECT id INTO admin_role_id FROM roles WHERE name = 'admin';
    SELECT id INTO reader_role_id FROM roles WHERE name = 'reader';

    INSERT INTO users (first_name, last_name, password, email, avatar)
    VALUES ('Andreas', 'Müller', '$2a$10$0FKjsRe3mwpGPhIQ/PrluOhb10lWMn2BkKV4Gh4IpAfAq1cXuh3P6', 'andreas.muller@test.com', 'https://mighty.tools/mockmind-api/content/human/7.jpg')
    RETURNING id INTO user_id;

    INSERT INTO user_role (user_id, role_id)
    VALUES (user_id, admin_role_id);

    INSERT INTO user_role (user_id, role_id)
    VALUES (user_id, reader_role_id);
END $$;
