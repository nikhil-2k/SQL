-- create database library;

CREATE TABLE Book(
    Book_id int,
    Title varchar(12),
    Publisher_Name , 
    Pub_Year
);

CREATE TABLE Publisher(
    Name varchar(12),
    Address varchar(12),
    Phone bigint,
    PRIMARY KEY(Name)
);

INSERT INTO Publisher value('Sudipta', 'kolkata', 7908079587);
INSERT INTO Publisher value('Sagar', 'Chennai', 8596345891);
INSERT INTO Publisher value("Nikhil", "Patna", 9675136584);
INSERT INTO Publisher value('Abhishek', "New Delhi", 9358649874);

SELECT * FROM Publisher;
