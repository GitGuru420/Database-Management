CREATE DATABASE MODULE_9_PRACTICE;
USE MODULE_9_PRACTICE;

-- PRIMARY KEY & FOREIGN KEY CONSTRAINTS
CREATE TABLE STUDENTS (
	StudentId INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Age INT,
    Class INT
);

CREATE TABLE COURSES (
	Student_ID INT,
	CourseName VARCHAR(20),
    FOREIGN KEY(Student_ID) REFERENCES STUDENTS(StudentId)
);

INSERT INTO STUDENTS(StudentID, FirstName, LastName, Age, Class)
VALUES(121, 'Nazmul', 'Siddik', 13, 8),
	  (120, 'Shakirul', 'Siddik', 18, 11),
      (213, 'Alamin', 'Siddik', 14, 9),
      (415, 'Shahed', 'Siddik', 13, 8),
      (111, 'Siam', 'Siddik', 15, 10),
      (101, 'Rejwan', 'Siddik', 10, 6),
      (333, 'Akash', 'Siddik', 10, 7),
      (212, 'Fazlu', 'Siddik', 14, 8);
      
INSERT INTO COURSES(Student_ID, CourseName)
VALUES(121, 'CSE1121'),
	  (120, 'PHITRON'),
      (213, 'DSA'),
      (415, 'DBMS'),
      (111, 'PYTHON'),
      (101, 'ALGORITHM'),
      (333, 'CHE158'),
      (212, 'DSA');
      

-- FOREIGN KEY ON DELETE OPERATION
CREATE TABLE NEW_COURSES (
	Student_ID INT,
	CourseName VARCHAR(20),
    FOREIGN KEY(Student_ID) REFERENCES STUDENTS(StudentId) ON DELETE CASCADE
);

INSERT INTO NEW_COURSES(Student_ID, CourseName)
VALUES(121, 'CSE1121'),
	  (120, 'PHITRON'),
      (213, 'DSA'),
      (415, 'DBMS'),
      (121, 'PYTHON'),
      (101, 'ALGORITHM'),
      (333, 'CHE158'),
      (212, 'DSA');
      
DELETE FROM STUDENTS
WHERE StudentID = 121;

CREATE TABLE NEW_COURSES (
	Student_ID INT,
	CourseName VARCHAR(20),
    FOREIGN KEY(Student_ID) REFERENCES STUDENTS(StudentId) ON DELETE SET NULL
);

INSERT INTO NEW_COURSES(Student_ID, CourseName)
VALUES(121, 'CSE1121'),
	  (120, 'PHITRON'),
      (213, 'DSA'),
      (415, 'DBMS'),
      (121, 'PYTHON'),
      (101, 'ALGORITHM'),
      (333, 'CHE158'),
      (212, 'DSA');

DELETE FROM STUDENTS
WHERE StudentID = 121;

-- SET OPERATION
-- UNION
SELECT * FROM STUDENTS
WHERE Age < 14
UNION
SELECT * FROM STUDENTS
WHERE class != 8;

-- UNION ALL
SELECT * FROM STUDENTS
WHERE Age < 14
UNION ALL
SELECT * FROM STUDENTS
WHERE class != 8;

-- INTERSECT
SELECT * FROM STUDENTS
WHERE Age < 14
INTERSECT
SELECT * FROM STUDENTS
WHERE class != 8;

-- EXCEPT
SELECT * FROM STUDENTS
WHERE Age < 14
EXCEPT
SELECT * FROM STUDENTS
WHERE class != 8;