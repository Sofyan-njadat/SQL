-- Create Database
CREATE DATABASE SchoolSystem;
USE SchoolSystem;

-- 1. Teachers Table
CREATE TABLE Teachers (
    ID INT PRIMARY KEY  ,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- 2. TeacherDetails Table (One-to-One with Teachers)
CREATE TABLE TeacherDetails (
    ID INT PRIMARY KEY ,
    TeacherID INT UNIQUE NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);

-- 3. Courses Table (Many-to-One with Teachers)
CREATE TABLE Courses (
    ID INT PRIMARY KEY ,
    CourseName VARCHAR(100) NOT NULL,
    CourseSubject VARCHAR(50) NOT NULL,
    TeacherID INT NOT NULL,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(ID)
);

-- 4. Students Table (Many-to-One with Courses)
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CourseID INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(ID)
);



/**--||||||||||||||||||||||||||||||||||||||||||||||||||||||--**/

-- Insert Teachers Data
INSERT INTO Teachers (ID , FirstName, LastName, Email) VALUES
(1, 'Sofyan', 'Njadat', 'Sfnnj@school.com'),
(2, 'Ahmad', 'Ali', 'ahmd@school.com'),
(3, 'Mhmad', 'Ahmad', 'moa@school.com'),
(4, 'Sami', 'Nazeh', 'sami@school.com'),
(5, 'Hamzh', 'Yousef', 'hmzhysf.b@school.com');

SELECT * FROM Teachers;


-- Insert TeacherDetails Data
INSERT INTO TeacherDetails (ID, TeacherID, DateOfBirth, Address, PhoneNumber) VALUES
(1, 1, '1980-05-15', 'Ajloun Main St', '0797777999'),
(2, 2, '1975-11-22', 'Ajloun Main St', '0797999777'),
(3, 3, '1990-03-08', 'Irbed Aydoun St', '0797000999'),
(4, 4, '1988-07-19', 'Irbed Aydoun St', '0797999000'),
(5, 5, '1983-12-25', 'Ajloun Halawah St', '0797777000');

SELECT * FROM TeacherDetails;


-- Insert Courses Data
INSERT INTO Courses (ID, CourseName, CourseSubject, TeacherID) VALUES
(1,'Mathematics 101', 'Math', 1),
(2, 'English Literature', 'English', 2),
(3, 'Computer Science', 'Science', 3),
(4, 'World History', 'History', 4),
(5, 'Art Fundamentals', 'Art', 5);

SELECT * FROM Courses;


-- Insert Students Data
INSERT INTO Students (ID, FirstName, LastName, Email, EnrollmentDate, CourseID) VALUES
(1, 'Abdllah', 'Mhmad', 'abd.m@student.com', '2024-09-01', 1),
(2, 'Noor', 'Saeed', 'noor@student.com', '2024-09-01', 2),
(3, 'Samerah', 'Fadi', 'smoora.f@student.com', '2024-09-01', 3),
(4, 'Ameera', 'Khaled', 'ameera@student.com', '2024-09-02', 4),
(5, 'Saief', 'Ahmad', 'sefo@student.com', '2023-04-03', 5);

TRUNCATE TABLE Students;

SELECT * FROM Students;

