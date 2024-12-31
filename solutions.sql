
--Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books
where book_title='To Kill a Mockingbird';


-- Task 2: Update an Existing Member's Address

Update Members
set member_address='155 main St'
where member_id='C103';
Select * from members;


-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS123' from the issued_status table.

SELECT * FROM issued_status
WHERE issued_id = 'IS123';

delete from issued_status where issued_id = 'IS123'


-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id='E101'

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.
select issued_emp_id,count(issued_id) as tottal_issued
from issued_status
group by 1
having count(issued_id)>1


--2.CTAS(create table as select)
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
Create table book_counts
AS
Select b.isbn,
b.book_title,
Count(ist.issued_id) as no_issued
from books  b
join issued_status  ist
on ist.issued_book_isbn=b.isbn
group by 1, 2;


-- Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic'


-- Task 8: Find Total Rental Income by Category:
select b.category,
SUM(b.rental_price),
count(*)
from books b
JOIN
issued_status ist
ON ist.issued_book_isbn = b.isbn
Group by 1;


-- Task 9: List Members Who Registered in the Last 180 Days:
select * from members;



