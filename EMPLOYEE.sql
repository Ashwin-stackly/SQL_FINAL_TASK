
CREATE DATABASE EMPLOYEE_MANAGEMENT;

USE EMPLOYEE_MANAGEMENT;

-- 1. Create Employee table

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

-- Insert Employee details

INSERT INTO Employee VALUES
(201, 'Ashok', 'IT', 62000, 'Chennai', '2022-02-15'),
(202, 'Bala', 'HR', 42000, 'Salem', '2021-04-10'),
(203, 'Charan', 'IT', 75000, 'Coimbatore', '2020-08-12'),
(204, 'Divya', 'Finance', 58000, 'Madurai', '2023-02-20'),
(205, 'Eswar', 'HR', 49000, 'Chennai', '2022-06-05'),
(206, 'Fathima', 'Finance', 68000, 'Madurai', '2021-09-18');

-- 2. Create Customers table

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

-- 3. Create Orders table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

-- 4. Create Students table

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

-- Insert Customer details

INSERT INTO Customers (customer_id, customer_name, city) VALUES
(11, 'Anitha', 'Chennai'),
(12, 'Bharath', 'Salem'),
(13, 'Deepa', 'Madurai'),
(14, 'Gokul', 'Coimbatore');

-- Insert Order details

INSERT INTO Orders (order_id, customer_id, amount, order_date) VALUES
(201, 11, 4500, '2026-01-10'),
(202, 11, 3500, '2026-01-15'),
(203, 12, 6500, '2026-02-05'),
(204, 13, 2800, '2026-02-12'),
(205, 13, 5000, '2026-02-20'),
(206, 11, 2500, '2026-03-01'),
(207, 11, 1800, '2026-03-05'),
(208, 11, 4000, '2026-03-10'),
(209, 12, 4500, '2026-03-12'),
(210, 12, 3000, '2026-03-15');

-- 1. Find the total number of employees in each department.

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department;

-- 2. Find the average salary of employees in each department.

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

-- 3. Display departments having more than one employee.

SELECT department, COUNT(*) AS total_employees
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

-- 4. Find the highest salary in each department.

SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

-- 5. Find the lowest salary in each department.

SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;

-- 6. Find departments whose average salary is greater than 50,000.

SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;

-- 7. Calculate the total salary expenditure for each department.

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- 8. Display all employees sorted by salary in descending order.

SELECT *
FROM Employee
ORDER BY salary DESC;

-- 9. Display employees sorted first by department and then by salary in descending order.

SELECT *
FROM Employee
ORDER BY department ASC, salary DESC;

-- 10. Find cities that have more than one employee.

SELECT city, COUNT(*) AS total_employees
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;

-- 11. Find the total salary paid in each city.

SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;

-- 12. Display departments ordered by total salary expenditure from highest to lowest.

SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;

-- 13. Find the number of employees in each department whose salary is greater than 50,000.

SELECT department, COUNT(*) AS total_employees
FROM Employee
WHERE salary > 50000
GROUP BY department;

-- 14. Find the difference between the highest and lowest salary in each department.

SELECT department, MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;

-- 15. Display the top 3 highest-paid employees.

SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 3;

-- 16. Find the total order amount for each customer.

SELECT customer_id, SUM(amount) AS total_amount
FROM Orders
GROUP BY customer_id;

-- 17. Find customers who have placed more than 3 orders.

SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 3;

-- 18. Find the average order amount for each customer.

SELECT customer_id, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY customer_id;

-- 19. Find the highest order amount placed by each customer.

SELECT customer_id, MAX(amount) AS highest_order_amount
FROM Orders
GROUP BY customer_id;

-- 20. Display customers sorted by their total purchase amount.

SELECT customer_id, SUM(amount) AS total_purchase
FROM Orders
GROUP BY customer_id
ORDER BY total_purchase DESC;

-- 21. Find customers whose total purchase amount exceeds 10,000.

SELECT customer_id, SUM(amount) AS total_purchase
FROM Orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;

-- 22. Display customer names along with the total number of orders placed.

SELECT Customers.customer_name,
       COUNT(Orders.order_id) AS total_orders
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name;

-- 23. Find the customer who spent the highest amount.

SELECT Customers.customer_name,
       SUM(Orders.amount) AS total_spent
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 24. Find the customer who placed the maximum number of orders.

SELECT Customers.customer_name,
       COUNT(Orders.order_id) AS total_orders
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
ORDER BY total_orders DESC
LIMIT 1;

-- 25. Find customers whose average order amount is greater than 2,000.

SELECT Customers.customer_name,
       AVG(Orders.amount) AS average_order_amount
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
HAVING AVG(Orders.amount) > 2000;

-- 26. Display the top 5 customers based on total purchase amount.

SELECT Customers.customer_name,
       SUM(Orders.amount) AS total_purchase
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
ORDER BY total_purchase DESC
LIMIT 5;

-- 27. Find the minimum order amount for each customer.

SELECT customer_id, MIN(amount) AS minimum_order_amount
FROM Orders
GROUP BY customer_id;

-- 28. Find customers who have placed orders worth more than 5,000 in total.

SELECT Customers.customer_name,
       SUM(Orders.amount) AS total_purchase
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
HAVING SUM(Orders.amount) > 5000;

-- 29. Display customer-wise total orders and total purchase amount.

SELECT Customers.customer_name,
       COUNT(Orders.order_id) AS total_orders,
       SUM(Orders.amount) AS total_purchase
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name;

-- 30. Find customers who placed more than 2 orders and spent more than 8,000.

SELECT Customers.customer_name,
       COUNT(Orders.order_id) AS total_orders,
       SUM(Orders.amount) AS total_purchase
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.customer_name
HAVING COUNT(Orders.order_id) > 2
   AND SUM(Orders.amount) > 8000;

-- Insert Student details (first set)

INSERT INTO Students (student_id, student_name, department, marks) VALUES
(21, 'Aravind', 'CSE', 82),
(22, 'Bhavani', 'IT', 91),
(23, 'Chandru', 'CSE', 74),
(24, 'Dharani', 'ECE', 79),
(25, 'Ganesh', 'IT', 72),
(26, 'Harini', 'CSE', 96),
(27, 'Inba', 'ECE', 66),
(28, 'Jeeva', 'IT', 86),
(29, 'Kavin', 'ECE', 92),
(30, 'Lavanya', 'CSE', 81);

-- 31. Find the average marks scored by students in each department.

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department;

-- 32. Find departments whose average marks are above 75.

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 75;

-- 33. Find the highest mark scored in each department.

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department;

-- 34. Find the total number of students in each department.

SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department;

-- Insert Student details (second set)

INSERT INTO Students (student_id, student_name, department, marks) VALUES
(31, 'Manoj', 'CSE', 87),
(32, 'Nandhini', 'CSE', 77),
(33, 'Praveen', 'CSE', 93),
(34, 'Revathi', 'CSE', 68),
(35, 'Sanjay', 'CSE', 89),
(36, 'Tharani', 'CSE', 76);

-- 35. Find departments having more than 5 students.

SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING COUNT(*) > 5;

-- 36. Display departments sorted by average marks in descending order.

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC;

-- 37. Find the top 3 departments based on average marks.

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
ORDER BY average_marks DESC
LIMIT 3;

-- 38. Find departments whose average marks are between 70 and 90.

SELECT department, AVG(marks) AS average_marks
FROM Students
GROUP BY department
HAVING AVG(marks) BETWEEN 70 AND 90;

-- 39. Find the total marks scored by students in each department.

SELECT department, SUM(marks) AS total_marks
FROM Students
GROUP BY department;

-- 40. Display departments sorted by the total number of students.

SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
ORDER BY total_students DESC;

-- 41. Find the lowest mark scored in each department.

SELECT department, MIN(marks) AS lowest_marks
FROM Students
GROUP BY department;

-- 42. Find departments where the highest mark is greater than 90.

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
HAVING MAX(marks) > 90;

-- 43. Find the number of students scoring above 80 in each department.

SELECT department, COUNT(*) AS total_students
FROM Students
WHERE marks > 80
GROUP BY department;

-- 44. Find departments where more than 3 students scored above 75.

SELECT department, COUNT(*) AS total_students
FROM Students
WHERE marks > 75
GROUP BY department
HAVING COUNT(*) > 3;

-- 45. Display departments ordered by highest mark in descending order.

SELECT department, MAX(marks) AS highest_marks
FROM Students
GROUP BY department
ORDER BY highest_marks DESC;
