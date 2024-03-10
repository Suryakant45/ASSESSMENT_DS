CREATE DATABASE SQL_ASSESSMENT;

USE SQL_ASSESSMENT;

CREATE TABLE runners (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Bobby Louis'),
(5, 'Lisa Romero');

CREATE TABLE races (
    id INT PRIMARY KEY,
    event VARCHAR(255) NOT NULL,
    winner_id INT,
    FOREIGN KEY (winner_id) REFERENCES runners(id)
);

INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathlon', NULL);

SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races);
-- Explanation: The result includes the runners who have not won any races, which means their id is not present in the winner_id column of the races table.



-- ALTERNATE VERSION OF CODE
SELECT r.*
FROM runners r
LEFT JOIN races ra ON r.id = ra.winner_id
WHERE ra.winner_id IS NULL;



############################################
ASSESSMENT_2

CREATE TABLE test_a (id NUMERIC);
CREATE TABLE test_b (id NUMERIC);

INSERT INTO test_a (id) VALUES
(10),
(20),
(30),
(40),
(50);

INSERT INTO test_b (id) VALUES
(10),
(30),
(50);

SELECT a.id
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;



############################################
ASSESSMENT_3

CREATE DATABASE SQL_ASSESSMENT1;

USE SQL_ASSESSMENT1;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

INSERT INTO users (user_id, username) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

CREATE TABLE training_details (
    user_training_id INT PRIMARY KEY,
    user_id INT,
    training_id INT,
    training_date DATE
);

INSERT INTO training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1, '2015-08-02'),
(2, 2, 1, '2015-08-03'),
(3, 3, 2, '2015-08-02'),
(4, 4, 2, '2015-08-04'),
(5, 2, 2, '2015-08-03'),
(6, 1, 1, '2015-08-02'),
(7, 3, 2, '2015-08-04'),
(8, 4, 3, '2015-08-03'),
(9, 1, 4, '2015-05-03'),
(10, 3, 1, '2015-08-02'),
(11, 4, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 1, '2015-08-02'),
(14, 4, 3, '2015-08-03');


SELECT
    u.user_id,
    u.username,
    td.training_id,
    td.training_date,
    COUNT(*) AS lesson_count
FROM
    users u
JOIN
    training_details td ON u.user_id = td.user_id
GROUP BY
    u.user_id,
    u.username,
    td.training_id,
    td.training_date
HAVING
    COUNT(*) > 1
ORDER BY
    td.training_date DESC;



############################################
ASSESSMENT_4

CREATE DATABASE SQL_ASSESSMENT2;

USE SQL_ASSESSMENT2;

CREATE TABLE Employee (
  Emp_Id INT,
  Emp_name VARCHAR(50),
  Salary INT,
  Manager_Id INT
);

INSERT INTO Employee VALUES
(10, 'Anil', 50000, 18),
(11, 'Vikas', 75000, 16),
(12, 'Nisha', 40000, 18),
(13, 'Nidhi', 60000, 17),
(14, 'Priya', 80000, 18),
(15, 'Mohit', 45000, 18),
(16, 'Rajesh', 90000, NULL),
(17, 'Raman', 55000, 16),
(18, 'Santosh', 65000, 17);

SELECT
  Manager_Id,
  Manager,
  AVG(Salary) AS Average_Salary_Under_Manager
FROM
  (
    SELECT
      e.Manager_Id,
      m.Emp_name AS Manager,
      e.Salary
    FROM
      Employee e
      JOIN Employee m ON e.Manager_Id = m.Emp_Id
  ) AS Subquery
GROUP BY
  Manager_Id, Manager;





