CREATE DATABASE Library;
USE Library;

/*********************************************/
CREATE TABLE Authors
(
	AuthorID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	BirthYear INT
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    PublishedYear INT,
    CopiesAvailable INT,
    BookCategory VARCHAR(50)
);

/*******************************************/
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear)
VALUES
(1, 'Sofyan', 'Yousef', 1994),
(2, 'Ahmad', 'Ali', 1996),
(3, 'Ali', 'Mhmad', 1990),
(4, 'Mhmad', 'Noor', 1992),
(5, 'Fadi', 'Ahmad', 1989);


INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory)
VALUES
(1, 'The Great Adventure', 1, 2010, 5, 'Fiction'),
(2, 'History of the World', 2, 2015, 3, 'Non-Fiction'),
(3, 'Programming Basics', 3, 2020, 10, 'Education'),
(4, 'Mystery of the Ages', 4, 2005, 2, 'Mystery'),
(5, 'Cooking Delights', 5, 2018, 7, 'Cookbook');


/*******************************************/
SELECT 
    b.BookID,
    b.Title,
    a.FirstName + ' ' + a.LastName AS AuthorName,
    b.PublishedYear,
    b.CopiesAvailable,
    b.BookCategory
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;
--*or*--
select * from Books;
select * from Authors;

/*******************************************/
SELECT top 1* FROM Books ORDER BY CopiesAvailable DESC;
--**or**--
select min (CopiesAvailable)  from Books;

SELECT TOP 1 * FROM Books ORDER BY CopiesAvailable ASC;
--**or**--
select max (CopiesAvailable)  from Books;

/*******************************************/
SELECT AVG(PublishedYear) AS AveragePublicationYear FROM Books;
--**or**--
select avg (PublishedYear) from Books;

/*******************************************/
SELECT COUNT(*) AS TotalBooks FROM Books;
--**or**--
select count (*) from Books;
/*******************************************/
TRUNCATE TABLE Books;

/*******************************************/
ALTER TABLE Authors
ADD Email VARCHAR(100),
    Phone_Number VARCHAR(20);

/*******************************************/
DROP TABLE Authors;



