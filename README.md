# 🚗 Vehicle Rental System – Database Design & SQL

## 📌 Project Overview
This project is a simple **Vehicle Rental System** designed to practice **database design** and **SQL queries**.

It models how a real rental service manages users, vehicles, and bookings using a relational database.

---

## 🗂️ Database Design
The database contains **three core tables**:

### Users
Stores system users.
- Supports **Admin** and **Customer** roles
- Email is unique for each user

### Vehicles
Stores vehicle information.
- Vehicle types are managed using **ENUMs** (car, bike, truck)
- Each vehicle has a unique registration number
- Availability status is handled using **ENUMs**

### Bookings
Stores rental records.
- Connects one user with one vehicle
- Booking status is handled using **ENUMs**
- Includes rental dates and total cost

---

## 🔗 Relationships
- One **User** can have multiple **Bookings**
- One **Vehicle** can have multiple **Bookings**
- Each booking links **exactly one user** and **one vehicle**

---
