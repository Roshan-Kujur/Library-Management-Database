-- 'memebers' table 
CREATE TABLE members (
  member_id INTEGER PRIMARY KEY,
  member_name VARCHAR(200) NOT NULL,
  email VARCHAR(200) UNIQUE NOT NULL,
  join_date DATE NOT NULL,
);

-- 'books' table
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INTEGER,
    published_year INTEGER,
    available_copies INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- 'authors' table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- 'book_borrow_records' table showcasing the records of book borrowing
CREATE TABLE book_borrow_records (
    record_seq INTEGER PRIMARY KEY,
    member_id INTEGER,
    book_id INTEGER,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Simple queries to add dummy values

INSERT INTO authors (author_id, author_name)
VALUES
(1, 'J.K. Rowling'),
(2, 'Jane Austen');

INSERT INTO books (book_id, title, author_id, published_year, available_copies)
VALUES
(101, 'Harry Potter and the Philosopher''s Stone', 1, 1997, 5),
(102, 'Pride and Prejudice', 3, 1813, 2);

INSERT INTO members (id, member_name, email, join_date)
VALUES
(1, 'Rohit Kumar', 'rohitkumar@xyz.com', '2024-01-10'),
(2, 'Anjali Singh', 'anjalish@qwe.com', '2024-02-15'),
(3, 'Kartik Sen', 'kartik23@qwe.com', '2024-03-01');

-- Query of entering data of borrowed book
INSERT INTO book_borrow_records (record_seq, member_id, book_id, issue_date, return_date)
VALUES
(1001, 1, 101, '2024-03-05', '2024-03-15');

-- Query to enter data of currently borrowed book
INSERT INTO book_borrow_records (record_seq, member_id, book_id, issue_date, return_date)
VALUES
(1002, 2, 102, '2024-03-20', NULL);
