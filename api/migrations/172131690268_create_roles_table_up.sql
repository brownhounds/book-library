CREATE TYPE user_role_enum AS ENUM ('admin', 'reader');

CREATE TABLE roles (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER updated_at_roles BEFORE UPDATE ON roles FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

INSERT INTO roles (name) VALUES ('admin'), ('reader');
