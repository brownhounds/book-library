WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('To Kill a Mockingbird', 'Harper Lee', '1960', 'A classic novel depicting racial injustice in the American South.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Classic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Classic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'To Kill a Mockingbird'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Classic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('1984', 'George Orwell', '1949', 'A dystopian novel portraying a totalitarian society.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Science Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Science Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = '1984'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Science Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Pride and Prejudice', 'Jane Austen', '1813', 'A classic novel exploring themes of love, marriage, and social norms.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Classic'), ('Romance')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Classic', 'Romance');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Pride and Prejudice'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Classic', 'Romance')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Great Gatsby', 'F. Scott Fitzgerald', '1925', 'A tale of the American Dream, wealth, and love during the Roaring Twenties.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Classic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Classic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Great Gatsby'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Classic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Moby-Dick', 'Herman Melville', '1851', 'The epic tale of Captain Ahab''s obsession with the white whale.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Adventure')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Adventure');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Moby-Dick'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Adventure')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Lord of the Rings', 'J.R.R. Tolkien', '1954', 'An epic fantasy saga about the quest to destroy the One Ring.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Adventure')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Adventure');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Lord of the Rings'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Adventure')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Catcher in the Rye', 'J.D. Salinger', '1951', 'A classic coming-of-age novel following Holden Caulfield''s journey.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Coming-of-age')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Coming-of-age');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Catcher in the Rye'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Coming-of-age')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Hobbit', 'J.R.R. Tolkien', '1937', 'The prequel to The Lord of the Rings, following Bilbo Baggins'' journey.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Adventure')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Adventure');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Hobbit'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Adventure')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', '1967', 'A multi-generational saga of the Buendía family in the fictional town of Macondo.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Magical Realism'), ('Literary Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Magical Realism', 'Literary Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'One Hundred Years of Solitude'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Magical Realism', 'Literary Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('War and Peace', 'Leo Tolstoy', '1869', 'A monumental work depicting the events of Russian society during the Napoleonic era.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Epic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Epic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'War and Peace'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Epic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Odyssey', 'Homer', '8th century BCE', 'An ancient Greek epic poem recounting Odysseus'' ten-year journey home after the Trojan War.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Epic'), ('Mythology')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Epic', 'Mythology');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Odyssey'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Epic', 'Mythology')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Divine Comedy', 'Dante Alighieri', '1320', 'An epic poem that follows the journey of the soul through Hell, Purgatory, and Heaven.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Epic'), ('Poetry')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Epic', 'Poetry');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Divine Comedy'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Epic', 'Poetry')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Brothers Karamazov', 'Fyodor Dostoevsky', '1880', 'A complex novel exploring themes of spirituality, morality, and human nature.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Classic'), ('Philosophical Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Classic', 'Philosophical Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Brothers Karamazov'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Classic', 'Philosophical Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Crime and Punishment', 'Fyodor Dostoevsky', '1866', 'A psychological thriller revolving around guilt, conscience, and redemption.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Classic'), ('Psychological Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Classic', 'Psychological Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Crime and Punishment'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Classic', 'Psychological Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Picture of Dorian Gray', 'Oscar Wilde', '1890', 'A novel about a man whose portrait ages while he retains his youth and beauty.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Gothic'), ('Philosophical Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Gothic', 'Philosophical Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Picture of Dorian Gray'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Gothic', 'Philosophical Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Brave New World', 'Aldous Huxley', '1932', 'A dystopian vision of a future society obsessed with pleasure and conformity.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Science Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Science Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Brave New World'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Science Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Count of Monte Cristo', 'Alexandre Dumas', '1844', 'An adventure novel of revenge, love, and redemption set in the early 19th century.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Adventure'), ('Historical Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Adventure', 'Historical Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Count of Monte Cristo'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Adventure', 'Historical Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Anna Karenina', 'Leo Tolstoy', '1877', 'A tragic love story set against the backdrop of Russian high society.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Classic'), ('Romance')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Classic', 'Romance');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Anna Karenina'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Classic', 'Romance')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Alchemist', 'Paulo Coelho', '1988', 'A philosophical novel about a shepherd boy''s journey to find his personal legend.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Philosophical')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Philosophical');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Alchemist'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Philosophical')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Adventures of Huckleberry Finn', 'Mark Twain', '1884', 'A satirical novel following Huck Finn''s journey down the Mississippi River.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Adventure'), ('Satire')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Adventure', 'Satire');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Adventures of Huckleberry Finn'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Adventure', 'Satire')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Iliad', 'Homer', '8th century BCE', 'An ancient Greek epic poem about the Trojan War and the hero Achilles.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Epic'), ('Mythology')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Epic', 'Mythology');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Iliad'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Epic', 'Mythology')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Lord of the Rings', 'J.R.R. Tolkien', '1954', 'A thrilling epic about the quest to destroy the One Ring and save Middle-earth from the dark lord Sauron.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Adventure')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Adventure');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Lord of the Rings'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Adventure')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Don Quixote', 'Miguel de Cervantes', '1605', 'A satirical novel about a deluded knight and his faithful squire, Sancho Panza.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Classic'), ('Satire')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Classic', 'Satire');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Don Quixote'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Classic', 'Satire')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Frankenstein', 'Mary Shelley', '1818', 'A novel about the creation of a monster and the consequences of playing god.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Gothic'), ('Science Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Gothic', 'Science Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Frankenstein'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Gothic', 'Science Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Alice''s Adventures in Wonderland', 'Lewis Carroll', '1865', 'A whimsical tale about a girl named Alice who falls into a magical world.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Children''s Literature')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Children''s Literature');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Alice''s Adventures in Wonderland'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Children''s Literature')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Little Prince', 'Antoine de Saint-Exupéry', '1943', 'A philosophical novella about a young prince''s journey through the universe.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fable'), ('Children''s Literature')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fable', 'Children''s Literature');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Little Prince'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fable', 'Children''s Literature')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Book Thief', 'Markus Zusak', '2005', 'A story of a girl living in Nazi Germany, narrated by Death.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('War')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'War');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Book Thief'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'War')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Slaughterhouse-Five', 'Kurt Vonnegut', '1969', 'An anti-war novel that mixes science fiction and dark humor.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Satire'), ('Science Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Satire', 'Science Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Slaughterhouse-Five'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Satire', 'Science Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Grapes of Wrath', 'John Steinbeck', '1939', 'A novel about the plight of migrant workers during the Great Depression.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Social Commentary')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Social Commentary');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Grapes of Wrath'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Social Commentary')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Fahrenheit 451', 'Ray Bradbury', '1953', 'A dystopian novel depicting a future society where books are banned.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Science Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Science Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Fahrenheit 451'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Science Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Lord of the Flies', 'William Golding', '1954', 'A novel about a group of British boys stranded on an uninhabited island.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Psychological Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Psychological Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Lord of the Flies'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Psychological Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', '1979', 'A comedic science fiction series about the misadventures of Arthur Dent.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Science Fiction'), ('Comedy')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Science Fiction', 'Comedy');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Hitchhiker''s Guide to the Galaxy'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Science Fiction', 'Comedy')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('A Tale of Two Cities', 'Charles Dickens', '1859', 'A historical novel set during the French Revolution, exploring themes of sacrifice and resurrection.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Classic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Classic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'A Tale of Two Cities'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Classic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Chronicles of Narnia', 'C.S. Lewis', '1950', 'A series of fantasy novels set in the magical land of Narnia.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Children''s Literature')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Children''s Literature');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Chronicles of Narnia'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Children''s Literature')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Handmaid''s Tale', 'Margaret Atwood', '1985', 'A dystopian novel set in a totalitarian society where women are subjugated.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Feminist Fiction')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Feminist Fiction');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Handmaid''s Tale'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Feminist Fiction')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Name of the Rose', 'Umberto Eco', '1980', 'A medieval mystery novel set in an Italian monastery.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Mystery')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Mystery');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Name of the Rose'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Mystery')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Trial', 'Franz Kafka', '1925', 'A surreal novel exploring themes of guilt, law, and justice.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Absurdist Fiction'), ('Existential')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Absurdist Fiction', 'Existential');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Trial'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Absurdist Fiction', 'Existential')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Kite Runner', 'Khaled Hosseini', '2003', 'A novel about friendship, redemption, and the impact of war in Afghanistan.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Drama')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Drama');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Kite Runner'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Drama')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Pillars of the Earth', 'Ken Follett', '1989', 'An epic historical novel set in 12th-century England, centered around the construction of a cathedral.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Adventure')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Adventure');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Pillars of the Earth'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Adventure')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Shadow of the Wind', 'Carlos Ruiz Zafón', '2001', 'A mystery novel set in post-war Barcelona, revolving around a forgotten book and its author.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Mystery'), ('Gothic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Mystery', 'Gothic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Shadow of the Wind'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Mystery', 'Gothic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Secret Garden', 'Frances Hodgson Burnett', '1911', 'A classic children''s novel about a young girl who discovers a hidden garden.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Children''s Literature'), ('Classic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Children''s Literature', 'Classic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Secret Garden'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Children''s Literature', 'Classic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Giver', 'Lois Lowry', '1993', 'A dystopian novel about a society with strict control over emotions and memories.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Dystopian'), ('Young Adult')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Dystopian', 'Young Adult');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Giver'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Dystopian', 'Young Adult')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Metamorphosis', 'Franz Kafka', '1915', 'A novella about a man who wakes up one morning transformed into a giant insect.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Absurdist Fiction'), ('Existential')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Absurdist Fiction', 'Existential');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Metamorphosis'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Absurdist Fiction', 'Existential')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Gone with the Wind', 'Margaret Mitchell', '1936', 'A historical novel set during the American Civil War, centered around Scarlett O''Hara.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Historical Fiction'), ('Romance')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Historical Fiction', 'Romance');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Gone with the Wind'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Historical Fiction', 'Romance')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Wind in the Willows', 'Kenneth Grahame', '1908', 'A children''s novel about the adventures of anthropomorphic animals.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Children''s Literature'), ('Fantasy')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Children''s Literature', 'Fantasy');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Wind in the Willows'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Children''s Literature', 'Fantasy')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('Dracula', 'Bram Stoker', '1897', 'A Gothic horror novel about the vampire Count Dracula''s attempt to move to England.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Gothic'), ('Horror')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Gothic', 'Horror');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'Dracula'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Gothic', 'Horror')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Call of the Wild', 'Jack London', '1903', 'An adventure novel about a domestic dog''s life in the wilds of the Yukon.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Adventure'), ('Nature')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Adventure', 'Nature');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Call of the Wild'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Adventure', 'Nature')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Stand', 'Stephen King', '1978', 'A post-apocalyptic horror novel about a deadly pandemic and its aftermath.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Horror'), ('Post-Apocalyptic')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Horror', 'Post-Apocalyptic');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Stand'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Horror', 'Post-Apocalyptic')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Color Purple', 'Alice Walker', '1982', 'A novel about the life of African-American women in the Southern United States.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fiction'), ('Historical')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fiction', 'Historical');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Color Purple'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fiction', 'Historical')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;



WITH inserted_book AS (
    INSERT INTO books (title, author, publication_year, description, cover_image)
    VALUES ('The Silmarillion', 'J.R.R. Tolkien', '1977', 'A collection of mythopoeic stories about the history of Middle-earth.', 'https://fakeimg.pl/667x1000/cc6600')
    RETURNING id AS book_id
)
SELECT book_id FROM inserted_book;

INSERT INTO genres (name)
VALUES ('Fantasy'), ('Mythopoeia')
ON CONFLICT (name) DO NOTHING;

SELECT id, name FROM genres WHERE name IN ('Fantasy', 'Mythopoeia');

WITH book AS (
    SELECT id AS book_id FROM books WHERE title = 'The Silmarillion'
),
genres AS (
    SELECT id AS genre_id FROM genres WHERE name IN ('Fantasy', 'Mythopoeia')
)
INSERT INTO book_genre (book_id, genre_id)
SELECT book.book_id, genre.genre_id
FROM book, genres genre;
