# Vehicle Rental System  
**Database Design & SQL Assignment Submission**

---

## Section 1: ERD Link
🔗 **Public ERD Link:**  
https://lucid.app/lucidchart/0a1daff3-717d-4622-be9f-cb87a79d7406/edit?viewport_loc=-1328%2C-297%2C1844%2C960%2C0_0&invitationId=inv_ffaa0101-b83b-42b4-a7c3-37b7afe6221a

---

## Section 2: Database Schema

### Table Creation Queries

```sql
CREATE TYPE user_role AS ENUM ('Admin', 'Customer');

CREATE TYPE vehicle_type AS ENUM ('car','bike','truck');

CREATE TYPE vehicle_status AS ENUM ('available','rented','maintenance');

CREATE TYPE booking_status AS ENUM ('pending','confirmed','completed','cancelled');

CREATE TABLE "Users" (
  "user_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "email" VARCHAR(255) NOT NULL UNIQUE,
  "phone" VARCHAR(20),
  "role" user_role NOT NULL,
  "password" VARCHAR(255) NOT NULL
);

CREATE TABLE "Vehicles" (
  "vehicle_id" SERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "type" vehicle_type NOT NULL,
  "model" VARCHAR(100),
  "registration_number" VARCHAR(50) NOT NULL UNIQUE,
  "rental_price" DECIMAL(10,2) NOT NULL,
  "status" vehicle_status NOT NULL
);

CREATE TABLE "Bookings" (
  "booking_id" SERIAL PRIMARY KEY,
  "user_id" INT NOT NULL,
  "vehicle_id" INT NOT NULL,
  "start_date" DATE NOT NULL,
  "end_date" DATE NOT NULL,
  "status" booking_status NOT NULL,
  "total_cost" DECIMAL(10,2) NOT NULL,
  CONSTRAINT "FK_Bookings_user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "Users"("user_id"),
  CONSTRAINT "FK_Bookings_vehicle_id"
    FOREIGN KEY ("vehicle_id")
      REFERENCES "Vehicles"("vehicle_id")
);
```

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
