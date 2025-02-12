CREATE DATABASE ModernSchoolManagement;
USE ModernSchoolManagement;

--Students Table--
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address NVARCHAR(255),
    Email NVARCHAR(255) 
);

--Family Table--
CREATE TABLE family_info (
    FamilyID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    FatherName NVARCHAR(100),
    FatherContact NVARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);


--Courses Table--
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    CourseSubject NVARCHAR(255),
    Resource NVARCHAR(255)
);


--Clasess Table--
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassCode NVARCHAR(50) NOT NULL,
    RoomNumber NVARCHAR(10),
    Schedule NVARCHAR(255)
);

--Assignments Table--
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    AssignmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    DueDate DATE,
);


--Attendance Table--
CREATE TABLE attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    AttendanceDate DATE NOT NULL,
    AttendanceType NVARCHAR(10) CHECK (AttendanceType IN ('leaving', 'absence', 'late')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);


--Enrollments Table--
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);


--Assignments Submissions Table--
CREATE TABLE Assignments_Submissions (
    SubmissionID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    AssignmentID INT,
    State NVARCHAR(10) CHECK (State IN ('pass', 'failed')),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID) ON DELETE CASCADE
);


-------------------------------------------------
--**Insert Data**--
-------------------------------------------------


INSERT INTO Students (Name, DateOfBirth, Address, Email) VALUES 
('Sofyan Yousef', '2006-02-10', 'Ajloun, Jordan', 'sfn@example.com'),
('Ali Khalid', '2005-06-15', 'Amman, Jordan', 'ali@example.com'),
('Mohammed Hassan', '2004-09-22', 'Irbid, Jordan', 'mohammed@example.com'),
('Oday Ahmad', '2003-04-10', 'Ajloun, Jordan', 'ody@example.com');

INSERT INTO family_info (StudentID, FatherName, FatherContact) VALUES 
(1, 'Yousef Njadat', '0777777777'),
(2, 'Khalid Nasser', '0797999999'),
(3, 'Hassan Emad', '0797999999');


INSERT INTO Courses (CourseName, CourseSubject, Resource) VALUES 
('Math', 'Basic Math Course', 'math_book.pdf'),
('SQL', 'Database Management', 'sql_guide.pdf'),
('History', 'Jordanian History', 'Jordanian_History.pdf');

INSERT INTO Enrollments (StudentID, CourseID) VALUES 
(1, 1), -- Sofyan --> Math
(1, 2), -- Sofyan --> SQL
(2, 3), -- Ali --> SQL
(3, 1), -- Mohammed --> Math
(4, 2); -- Oday --> SQL


INSERT INTO Assignments (AssignmentName, Description, DueDate) VALUES 
('SQL Assignment', 'Database queries task', '2024-02-15'), 
('Math Assignment', 'Algebra questions', '2024-02-20');

INSERT INTO Assignments_Submissions (StudentID, AssignmentID, State) VALUES 
(1, 2, 'pass'),
(1, 1, 'pass'),
(3, 1, 'failed');

INSERT INTO attendance (StudentID, AttendanceDate, AttendanceType) VALUES 
(1, '2024-01-02', 'leaving'),
(2, '2024-01-04', 'absence'),
(3, '2024-01-05', 'leaving');



-------------------------------------------------
-- The Questions : 
-------------------------------------------------
-- 1-
SELECT * FROM Students WHERE DateOfBirth = '2006-02-10';
-- 2-
SELECT * FROM Courses WHERE CourseName = 'Math';

-- 3- Add a new column 'Email' to the Students table ?
ALTER TABLE Students ADD Phone INT; ---اضفنا الهاتف لان الايميل مضاف عند انشاء التيبل
--4-
INSERT INTO Students (Name, DateOfBirth, Address, Email)
VALUES ('Omar Taha', '2007-03-25', 'Aqaba, Jordan', 'omar@example.com');

-- 5- تحديد الطلاب اللي مسجلين معلوات الاهل
SELECT s. StudentID, Name 
FROM Students s
INNER JOIN family_info f ON s.StudentID = f.StudentID;

-- 6- الطلاب اللي مسجلين بماده 
SELECT s. Name
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'SQL';

-- 7- 
SELECT s.StudentID, Name , a.AssignmentName, sub.State
FROM Students s
INNER JOIN Assignments_Submissions sub ON s.StudentID = sub.StudentID
INNER JOIN Assignments a ON sub.AssignmentID = a.AssignmentID
WHERE a.AssignmentName = 'SQL Assignment' AND sub.State = 'pass';
--- عرض جميع الطلاب الي قدموا الواجب
SELECT s.Name, a.AssignmentName, sub.State
FROM Students s
INNER JOIN Assignments_Submissions sub ON s.StudentID = sub.StudentID
INNER JOIN Assignments a ON sub.AssignmentID = a.AssignmentID;


-- 8-
SELECT s. StudentID, Name
FROM Students s
INNER JOIN attendance att ON s.StudentID = att.StudentID
WHERE att.AttendanceType = 'leaving' 
AND att.AttendanceDate BETWEEN '2024-01-01' AND '2024-01-05';














