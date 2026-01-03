-- SQL Queries for Vehicle Booking System

-- Query 1: JOIN
-- Retrieve booking information along with customer and vehicle details
-- Concepts used: INNER JOIN
-- Retrieves: Customer name, Vehicle name
SELECT 
    b.booking_id, 
    u.name AS "Customer name",
    v.name AS "Vehicle name",
    b.start_date,
    b.end_date,
    b.status
FROM "Users" u
INNER JOIN "Bookings" b USING(user_id)
INNER JOIN "Vehicles" v USING(vehicle_id);

-- Query 2: EXISTS
-- Find all vehicles that have never been booked
-- Concepts used: NOT EXISTS
SELECT 
    v.vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
FROM "Vehicles" v
WHERE NOT EXISTS (
    SELECT 1
    FROM "Bookings" b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g., cars)
-- Concepts used: WHERE clause with multiple conditions
SELECT
    *
FROM "Vehicles"
WHERE status = 'available'
  AND type = 'car';

-- Query 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings
-- Concepts used: GROUP BY, HAVING, COUNT
SELECT
    v.name,
    COUNT(b.booking_id) AS total_bookings
FROM "Vehicles" v
INNER JOIN "Bookings" b USING(vehicle_id)
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
