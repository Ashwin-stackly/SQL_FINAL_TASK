
CREATE DATABASE RAILWAY_RESERVATION_SCENARIO;

USE RAILWAY_RESERVATION_SCENARIO;

-- Create trains table

CREATE TABLE trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

-- Create bookings table

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

-- Insert train details

INSERT INTO trains (train_name, source, destination) VALUES
('Chola Express', 'Chennai', 'Trichy'),
('Pandian Express', 'Coimbatore', 'Salem'),
('Kongu Express', 'Madurai', 'Chennai');

-- Insert booking details

INSERT INTO bookings (train_id, passenger_name, fare, status) VALUES
(1, 'Ashok', 550, 'Confirmed'),
(1, 'Bala', 550, 'Waiting'),
(2, 'Charan', 350, 'Confirmed'),
(3, 'Divya', 450, 'Cancelled'),
(2, 'Eswar', 350, 'Confirmed');

-- 41. Retrieve all bookings with fare greater than 400.

SELECT *
FROM bookings
WHERE fare > 400;

-- 42. Find bookings where status is not 'Confirmed'.

SELECT *
FROM bookings
WHERE status <> 'Confirmed';

-- 43. Display trains starting from Chennai.

SELECT *
FROM trains
WHERE source = 'Chennai';

-- 44. Retrieve bookings with fare between 300 and 500.

SELECT *
FROM bookings
WHERE fare BETWEEN 300 AND 500;

-- 45. Find passengers whose names start with 'A'.

SELECT *
FROM bookings
WHERE passenger_name LIKE 'a%';

-- 46. Retrieve train names along with passenger names.

SELECT trains.train_name, bookings.passenger_name
FROM trains
JOIN bookings
ON trains.train_id = bookings.train_id;

-- 47. Count number of bookings for each train.

SELECT train_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY train_id;

-- 48. Display train names and total fare collected for each train.

SELECT trains.train_name, SUM(bookings.fare) AS total_fare
FROM trains
JOIN bookings
ON trains.train_id = bookings.train_id
GROUP BY trains.train_id, trains.train_name;

-- 49. Find bookings with fare equal to the highest fare.

SELECT *
FROM bookings
WHERE fare = (SELECT MAX(fare) FROM bookings);

-- 50. Retrieve trains that have more than one booking.

SELECT trains.train_name,
       COUNT(bookings.booking_id) AS total_bookings
FROM trains
JOIN bookings
ON trains.train_id = bookings.train_id
GROUP BY trains.train_id, trains.train_name
HAVING COUNT(bookings.booking_id) > 1;
