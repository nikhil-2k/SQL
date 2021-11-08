drop database if exists library;
create database library;
use library;

-- publisher table
CREATE TABLE publisher(
    Name VARCHAR(12),
    Address VARCHAR(12),
    Phone BIGINT,
    PRIMARY KEY(name)
);

INSERT INTO publisher VALUE("Sudipta", "kolkata", 9547441120);
INSERT INTO publisher VALUE("Nikhil", "Patna", 7908079587);
INSERT INTO publisher VALUE("Sagar", "Ranchi", 9635868981);
INSERT INTO publisher VALUE("Abhishek", "Patna", 9386897425);
INSERT INTO publisher VALUE("Mudit", "Bangalore", 8947625462);
INSERT INTO publisher VALUE("Aman", "Jaipur", 9863524968);
INSERT INTO publisher VALUE("Prajwal", "New Delhi", 6239856484);

-- book table
CREATE TABLE book(
    book_id INT, 
    title VARCHAR(30),
    publisher_name VARCHAR(10), 
    pub_year INT, 
    PRIMARY KEY(book_id), 
    FOREIGN KEY(publisher_name) REFERENCES publisher(name) on delete cascade 
);

INSERT INTO book VALUE(1, "DBMS", "Abhishek", 2015);
INSERT INTO book VALUE(2, "C/C++", "Sudipta", 2012);
INSERT INTO book VALUE(3, "Python", "Nikhil", 2016);
INSERT INTO book VALUE(4, "Machine Learning", "Sagar", 2013);
INSERT INTO book VALUE(5, "Javascript", "Sudipta", 2019);
INSERT INTO book VALUE(6, "Android Development", "Aman", 2020);
INSERT INTO book VALUE(7, "Big Data", "Mudit", 2017);

-- author table
CREATE TABLE book_authors (
    book_id INT,
    author_name VARCHAR(15), 
    PRIMARY KEY(book_id, author_name),
    FOREIGN KEY(book_id) REFERENCES book(book_id) on delete cascade 
);

INSERT INTO book_authors VALUE(1,'navathe');
INSERT INTO book_authors VALUE(2,'navathe');
INSERT INTO book_authors VALUE(3,'tenenboum');
INSERT INTO book_authors VALUE(4,'edward');
INSERT INTO book_authors VALUE(5,'galvin');

-- library branch table
CREATE TABLE library_branch(
    branch_id INT,
    branch_name VARCHAR(10), 
    address VARCHAR(15),
    PRIMARY KEY(branch_id)
);

INSERT INTO library_branch VALUE(10,'RR nagar', 'Bangalore');
INSERT INTO library_branch VALUE(11,'Manipal', 'Delhi');
INSERT INTO library_branch VALUE(12,'RNSIT', 'Kolkata');
INSERT INTO library_branch VALUE(13,'Rajajnagar', 'Punjab');
INSERT INTO library_branch VALUE(14,'Nitte', 'Goa');

-- book copies table
CREATE TABLE book_copies(
    book_id INT, 
    branch_id INT,
    no_of_copies INT, 
    PRIMARY KEY(book_id,branch_id),
    FOREIGN KEY(book_id) REFERENCES book(book_id) on delete cascade, 
    FOREIGN KEY(branch_id) REFERENCES library_branch(branch_id) on delete cascade
);
INSERT INTO book_copies VALUE(1, 10, 10);
INSERT INTO book_copies VALUE(1, 11, 5);
INSERT INTO book_copies VALUE(2, 12, 2);
INSERT INTO book_copies VALUE(2, 13, 5);
INSERT INTO book_copies VALUE(3, 14, 7);
INSERT INTO book_copies VALUE(5, 10, 1);
INSERT INTO book_copies VALUE(4, 11, 3);

-- book lending
CREATE TABLE book_lending(
    book_id INT, 
    branch_id INT,
    card_no INT, 
    DATE_out DATE, 
    due_DATE DATE, 
    PRIMARY KEY(book_id,branch_id,card_no), 
    FOREIGN KEY(book_id) REFERENCES book(book_id), 
    FOREIGN KEY(branch_id) REFERENCES library_branch(branch_id) on delete cascade
);

INSERT INTO book_lending VALUE(1, 10, 101, '2017-01-01', '2017-06-01');
INSERT INTO book_lending VALUE(3, 14, 101, '2017-01-11', '2017-03-11');
INSERT INTO book_lending VALUE(2, 13, 101, '2017-02-17', '2017-04-21');
INSERT INTO book_lending VALUE(4, 11, 101, '2017-03-15', '2017-07-15');
INSERT INTO book_lending VALUE(1, 11, 104, '2017-04-12', '2017-05-12');

SELECT 
    b.book_id, b.title, b.publisher_name, a.author_name, c.no_of_copies, c.branch_id 
    FROM book b,book_authors a, book_copies c 
    WHERE b.book_id = a.book_id AND b.book_id = c.book_id;

SELECT card_no FROM book_lending WHERE date_out BETWEEN '2017-01-01' AND '2017-06-30' GROUP BY card_no HAVING count(*) > 3;

SELECT * FROM book;
DELETE FROM book WHERE book_id = 6;
SELECT * FROM book;