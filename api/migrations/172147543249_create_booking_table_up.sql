CREATE TYPE bookings_status_enum AS ENUM ('pending', 'collected', 'returned');

CREATE TABLE bookings (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    book_id UUID NOT NULL,
    status bookings_status_enum DEFAULT 'pending',
    return_date TIMESTAMP WITH TIME ZONE NULL,
    collected_date TIMESTAMP WITH TIME ZONE NULL,
    returned_date TIMESTAMP WITH TIME ZONE NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

CREATE INDEX idx_bookings_user_id_book_id_status ON bookings (user_id, book_id);

CREATE TRIGGER updated_at_bookings BEFORE UPDATE ON bookings FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
