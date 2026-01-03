# Vehicle Rental System  
**Database Design & SQL Assignment Submission**

---
🔗 **Public ERD Link:**  
https://lucid.app/lucidchart/0a1daff3-717d-4622-be9f-cb87a79d7406/edit?viewport_loc=-1525%2C103%2C1651%2C655%2C0_0&invitationId=inv_ffaa0101-b83b-42b4-a7c3-37b7afe6221a
---

## SQL Queries

### Query 1: JOIN
**Description:** Retrieve booking information along with customer and vehicle details.

**Concepts used:** INNER JOIN

**Retrieves:**
- Customer name
- Vehicle name

```sql
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
```

### Query 2: EXISTS
**Description:** Find all vehicles that have never been booked.

**Concepts used:** NOT EXISTS

```sql
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
```

### Query 3: WHERE
**Description:** Retrieve all available vehicles of a specific type (e.g., cars).

**Concepts used:** WHERE clause with multiple conditions

```sql
SELECT
    *
FROM "Vehicles"
WHERE status = 'available'
  AND type = 'car';
```

### Query 4: GROUP BY and HAVING
**Description:** Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

**Concepts used:** 
- GROUP BY 
- HAVING 
- COUNT

```sql
SELECT
    v.name,
    COUNT(b.booking_id) AS total_bookings
FROM "Vehicles" v
INNER JOIN "Bookings" b USING(vehicle_id)
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
```

---

## Section 3: Video Link (Theory Answers)

https://drive.google.com/file/d/1zMctYh5XgljVz6r_dcNHK-0-A_afBYs8/view?usp=sharing

---
## ✅ End of Submission
