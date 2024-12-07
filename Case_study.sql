-- 1. CUSTOMERS
-- 1.1) Which customers had reservations on 2023-12-18?
SELECT name, date
FROM customer AS c
INNER JOIN table_reservation AS r
ON c.customerID = r.customerID
WHERE date = '2023-12-18';

-- 1.2) Who is the customer with the most reservations in the restaurant?
SELECT name
FROM customer c
NATURAL JOIN table_reservation t
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 1.3) Which customers have more reservations than Martinas Ramona?
WITH Ramona AS(
SELECT COUNT(*) as count_Ramona
FROM customer c
INNER JOIN table_reservation r
ON c.customerID = r.customerID
WHERE name = 'Martinas Ramona')
SELECT name
FROM customer c
INNER JOIN table_reservation r
ON c.customerID = r.customerID
GROUP BY (name)
HAVING COUNT(*) > (SELECT count_Ramona FROM Ramona);

-- 1.4) Who is the customer who made the most expensive order?
SELECT c.name, quantity*price AS total_price
FROM customer AS c
INNER JOIN orders AS o
ON c.customerID = o.customerID
INNER JOIN product AS p
ON o.productID = p.productID
GROUP BY orderID
ORDER BY total_price DESC
LIMIT 1;

-- 1.5) Which customers placed more than one order?
SELECT name, COUNT(orderID) AS count
FROM customer
NATURAL JOIN orders
GROUP BY name
HAVING count > 1;

-- 2. ORDERS
-- 2.1) How many order took place on 2023-12-09, and who honored them?
SELECT name, date
FROM orders AS o
INNER JOIN employee AS e
ON o.employeeID = e.employeeID
WHERE date = '2023-12-09'
GROUP BY name;

-- 2.2) What is the average price of orders made in the first half of December (15)?
SELECT AVG(quantity*price) AS avg_total_after_15_dec
FROM orders o
INNER JOIN product p
ON o.productID = p.productID
WHERE o.date < "2023-12-15";

-- 3. PAYMENTS
-- 3.1) What is the most common payment method used for deliveries made after 1pm?
SELECT method, COUNT(method) as count_method
FROM cashier c
WHERE deliveryID IN (
SELECT deliveryID
FROM delivery
WHERE time >= '13%'
)
GROUP BY method
ORDER BY count_method DESC 
LIMIT 1;

-- 3.2) What percentage does each type of payment have?
SELECT method, COUNT(*) as count, ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cashier)), 2) AS percentage
FROM cashier
GROUP BY method;

-- 4. PRODUCTS
-- 4.1) Extract the top 4 products with the most order.
SELECT productID, name, description, COUNT(productID) AS count_product
FROM orders
NATURAL JOIN product
GROUP BY productID
ORDER BY 4 DESC
LIMIT 4;

-- 4.2) What products were most frequently sold on weekends (2,3-9,10-16,17-23,24-30,31)?
SELECT p.name, COUNT(p.name) AS count_product
FROM product p
INNER JOIN orders o
ON p.productID = o.productID
WHERE DAY(o.date) IN (2, 3, 9, 10, 16, 17, 23, 24, 30, 31)
GROUP BY p.name
ORDER BY 2 DESC
LIMIT 3;

-- 5. EMPLOYEE
-- 5.1) Which employees handle each order placed by the customer?
SELECT e.name AS employer_name, o.orderID, c.name AS customer_name, c.phone AS customer_phone
FROM employee AS e
INNER JOIN orders AS o
ON e.employeeID = o.employeeID
INNER JOIN customer AS c
ON o.customerID = c.customerID;

-- 5.2) Who are the employees whose salary is higher than 2500 RON (more) and who have less?
SELECT name, salary,
CASE
WHEN salary >= 2500.00 THEN 'more'
ELSE 'less'
END AS limit_2500_RON
FROM employee
ORDER BY 2, 3;

-- 5.3) Which employee had receipts by Cash or Credit Card?
SELECT name, method
FROM employee e
NATURAL JOIN delivery d
NATURAL JOIN cashier c
WHERE method = 'Cash' OR method = 'Card'
ORDER BY method;

-- 5.4) Which employees made the highest number of delivery?
SELECT e.name, COUNT(d.employeeID) as count_of_delivery
FROM delivery d
INNER JOIN employee e 
ON d.employeeID = e.employeeID
GROUP BY e.name
HAVING count_of_delivery > 1;

-- 5.5) What is the average salary by gender for employees? But what is the minimum or maximum?
SELECT gender, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary, COUNT(salary) AS count
FROM employee
GROUP BY gender;

-- 5.6) Which employee did not make any reservation or deliveries?
WITH delivery_e AS (
SELECT DISTINCT d.employeeID
FROM delivery d
),
reservation_e AS (
SELECT DISTINCT r.employeeID
FROM table_reservation r
)
SELECT e.*, d.employeeID AS delivery, r.employeeID AS reservation
FROM employee e
LEFT JOIN delivery_e d ON e.employeeID = d.employeeID
LEFT JOIN reservation_e r ON e.employeeID = r.employeeID
WHERE d.employeeID IS NULL AND r.employeeID IS NULL;


-- 6. RESERVATION
-- 6.1) Which reservations were canceled on the same day as reservation made on 2023-12-10?
SELECT reservationID, date, time, c.name AS customer_name, e.name AS employee_name
FROM table_reservation t
INNER JOIN employee e
ON t.employeeID = e.employeeID
INNER JOIN customer c
ON t.customerID = c.customerID
WHERE date = '2023-12-10';

-- 6.2) Display the customer with the most reservation made.
SELECT name AS customer_name, COUNT(reservationID) AS more_than_one_reservation
FROM table_reservation t
INNER JOIN customer c
ON t.customerID = c.customerID
GROUP BY name
HAVING more_than_one_reservation > 1
ORDER BY 2 DESC;

-- 6.3) Most reservation were canceled during the week or on the weekend?
WITH canceled AS(
SELECT date
FROM table_reservation AS t
INNER JOIN canceled_reservation c
ON t.reservationID = c.reservationID 
),
dayType AS (
SELECT *,
CASE
WHEN DAY(date) NOT IN (2, 3, 9, 10, 16, 17, 23, 24, 30, 31) THEN 'week'
ELSE 'weekend'
END AS day_type
FROM canceled
),
count_day_type AS(
SELECT  day_type, COUNT(day_type) as count
FROM dayType
GROUP BY day_type)
SELECT * 
FROM count_day_type
ORDER BY 2 DESC;

-- 6.4) What is the most common reason for canceling a reservation?
SELECT reason
FROM canceled_reservation
GROUP BY reason
ORDER BY COUNT(reason) DESC
LIMIT 1;

-- 7. FEEDBACK
-- 7.1) What feedback from customers predominates the most?
WITH rating_grouped_count AS(
SELECT rating, COUNT(rating) AS counted_rating, 
CASE
WHEN rating BETWEEN 1 AND 2 THEN 'Bad'
WHEN rating BETWEEN 2 AND 4 THEN 'Good'
WHEN rating = 5 THEN 'Very Good'
END AS rating_status
FROM feedback
GROUP BY rating),
max_feedback AS(
SELECT max(counted_rating) AS max
FROM rating_grouped_count)
SELECT rating, counted_rating, rating_status 
FROM rating_grouped_count NATURAL JOIN max_feedback
ORDER BY 2 DESC
LIMIT 1;