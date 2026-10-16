
CREATE DATABASE BANKING_SCENARIO;

USE BANKING_SCENARIO;

-- Create customers table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Create accounts table

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

-- Insert customer details

INSERT INTO customers (name, city) VALUES
('Ashok', 'Chennai'),
('Bala', 'Coimbatore'),
('Charan', 'Madurai'),
('Divya', 'Salem');

INSERT INTO customers (name, city) VALUES
('Eswar', 'Salem'),
('Fathima', 'Erode');

-- Insert account details

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1, 'Savings', 55000),
(2, 'Current', 25000),
(3, 'Savings', 35000),
(4, 'Savings', 18000),
(5, 'Current', 42000);

-- 1. All accounts with balance greater than 20000

SELECT * FROM accounts WHERE balance > 20000;

-- 2. Find customers who live in Chennai.

SELECT * FROM customers WHERE city = 'Chennai';

-- 3. Display accounts with balance between 20,000 and 50,000.

SELECT * FROM accounts WHERE balance BETWEEN 20000 AND 500000;

-- 4. Find customers whose names start with 'J'.

SELECT * FROM customers WHERE name LIKE 'j%';

-- 5. Retrieve accounts of type 'Savings' or 'Current'.

SELECT * FROM accounts
WHERE account_type = 'Savings' OR account_type = 'Current';

-- 6. Display accounts that are not 'Savings'.

SELECT * FROM accounts WHERE account_type NOT IN ('Savings');

-- 7. Find customers whose names contain the letter 'a'.

SELECT * FROM customers WHERE name LIKE '%a%';

-- 8. Retrieve accounts with balance less than or equal to 30,000.

SELECT * FROM accounts WHERE balance <= 30000;

-- 9. Find customers who are not from Madurai.

SELECT * FROM customers WHERE city NOT IN ('Madurai');

-- 10. Display accounts where balance is not between 10,000 and 40,000.

SELECT * FROM accounts
WHERE balance NOT BETWEEN 10000 AND 40000;

-- 11. Retrieve customers whose names end with 'i'.

SELECT * FROM customers WHERE name LIKE '%i';

-- 12. Find accounts with balance equal to 50,000.

SELECT * FROM accounts WHERE balance = 50000;

-- 13. Display customers whose city is either Chennai or Salem.

SELECT * FROM customers
WHERE city = 'Chennai' OR city = 'Salem';

-- 14. Find accounts with balance greater than 10,000 and less than 40,000.

SELECT * FROM accounts
WHERE balance > 10000 AND balance < 40000;

-- 15. Retrieve accounts where account type is not in ('Current').

SELECT * FROM accounts WHERE account_type NOT IN ('Current');

-- 16. Display all accounts sorted by balance in descending order.

SELECT * FROM accounts ORDER BY balance DESC;

-- 17. List customers sorted alphabetically by name.

SELECT * FROM customers ORDER BY name ASC;

-- 18. Display accounts sorted by account type and then by balance (descending).

SELECT * FROM accounts
ORDER BY account_type DESC, balance DESC;

-- 19. Find the total balance of all accounts.

SELECT SUM(balance) AS total_balance FROM accounts;

-- 20. Calculate the average balance of accounts.

SELECT AVG(balance) AS average_ballance FROM accounts;

-- 21. Find the maximum account balance.

SELECT MAX(balance) AS Maximum FROM accounts;

-- 22. Find the minimum account balance.

SELECT MIN(balance) AS Minumum FROM accounts;

-- 23. Count the total number of customers.

SELECT COUNT(name) AS Total_Number FROM customers;

-- 24. Find total balance grouped by account type.

SELECT account_type, SUM(balance) AS Total_balance
FROM accounts
GROUP BY account_type;

-- 25. Find average balance for each account type.

SELECT account_type, AVG(balance) AS Average_balance
FROM accounts
GROUP BY account_type;

-- 26. Display account types having average balance greater than 20,000.

SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;

-- 27. Count number of accounts for each customer.

SELECT customer_id, COUNT(*) AS total_accounts
FROM accounts
GROUP BY customer_id;

-- 28. Display customers having more than one account.

SELECT customer_id, COUNT(*) AS total_accounts
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 29. Retrieve customer names along with their account balances.

SELECT customers.name, accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id;

-- 30. Display all customers and their accounts
-- (including customers without accounts).

SELECT customers.*, accounts.*
FROM customers
LEFT JOIN accounts
ON customers.customer_id = accounts.customer_id;

-- 31. Display all accounts and corresponding customer details.

SELECT accounts.*, customers.name, customers.city
FROM accounts
INNER JOIN customers
ON accounts.customer_id = customers.customer_id;

-- 32. Retrieve customer names and account types where balance is greater than 20,000.

SELECT customers.name, accounts.account_type
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.balance > 20000;

-- 33. List customers with their total balance using JOIN.

SELECT customers.name, SUM(accounts.balance) AS total_balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.name;

-- 34. Display customer names and balances sorted by balance.

SELECT customers.name, accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
ORDER BY accounts.balance ASC;

-- 35. Count number of accounts for each city using JOIN.

SELECT customers.city, COUNT(accounts.account_id) AS total_accounts
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.city;

-- 36. Find accounts with balance greater than average balance.

SELECT *
FROM accounts
WHERE balance > (SELECT AVG(balance) FROM accounts);

-- 37. Retrieve customers who have accounts.

SELECT DISTINCT customers.*
FROM customers
INNER JOIN accounts
ON customers.customer_id = accounts.customer_id;

-- 38. Find customers who do not have any accounts.

SELECT customers.*
FROM customers
LEFT JOIN accounts
ON customers.customer_id = accounts.customer_id
WHERE accounts.account_id IS NULL;

-- 39. Display account(s) with the maximum balance.

SELECT *
FROM accounts
WHERE balance = (SELECT MAX(balance) FROM accounts);

-- 40. Find customers whose total balance is greater than 40,000.

SELECT customers.customer_id, customers.name,
       SUM(accounts.balance) AS total_balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id
GROUP BY customers.customer_id, customers.name
HAVING SUM(accounts.balance) > 40000;


SELECT * FROM customers;


SELECT * FROM accounts;
