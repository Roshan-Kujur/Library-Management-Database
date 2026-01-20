-- So this query will retrieve the data of previous borrow records but given the books have been returned
SELECT 
    m.member_name,
    b.title AS book_title,
    a.author_name,
    br.issue_date,
    br.return_date
FROM book_borrow_records br
JOIN members m ON br.member_id = m.id
JOIN books b ON br.book_id = b.book_id
LEFT JOIN authors a ON b.author_id = a.author_id;

-- This query will give the data of currently borrowed books
SELECT 
    m.member_name,
    b.title,
    br.issue_date
FROM book_borrow_records br
JOIN members m ON br.member_id = m.id
JOIN books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL;

-- This query will reveal those members who have borrowed atleast three books or more
SELECT 
    m.member_name,
    COUNT(br.record_seq) AS total_borrowed
FROM members m
JOIN book_borrow_records br ON m.id = br.member_id
GROUP BY m.member_name
HAVING COUNT(br.record_seq) >= 3;

