-- 'memebers' table 
CREATE TABLE members (
  id INTEGER PRIMARY KEY,
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
