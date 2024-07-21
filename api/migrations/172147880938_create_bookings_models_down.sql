DROP FUNCTION IF EXISTS request_booking(p_user_id UUID, p_book_id UUID);
DROP FUNCTION IF EXISTS mark_booking_collected(
    p_user_id UUID,
    p_book_id UUID,
    p_collected_date TIMESTAMP WITH TIME ZONE,
    p_return_date TIMESTAMP WITH TIME ZONE
);
DROP FUNCTION IF EXISTS mark_booking_return(
    p_user_id UUID,
    p_book_id UUID,
	p_returned_date TIMESTAMP WITH TIME ZONE
);
DROP FUNCTION IF EXISTS get_active_requests();
