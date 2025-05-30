# 🏢 Hostel Management System

A **web-based Java application** to manage hostel student admissions, room allocations, and fee payments using **JSP, Servlets, JDBC, and MySQL**, following the **MVC architecture**.

---

## 🚀 Features

- ➕ Add new student details  
- ✏️ Update existing student information  
- ❌ Delete student records  
- 📋 Display all or individual student information  
- 📊 Generate reports:
  - Students with pending fees  
  - Students in a specific room  
  - Students admitted within a specific date range  

---

## 🧱 Database Setup

### 1. Create Database

```sql
CREATE DATABASE IF NOT EXISTS hostel_management;
USE hostel_management;

### 2. Create Table
CREATE TABLE HostelStudents (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    RoomNumber VARCHAR(10),
    AdmissionDate DATE,
    FeesPaid DECIMAL(10,2),
    PendingFees DECIMAL(10,2)
);

### 3. Insert Sample Data

INSERT INTO HostelStudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES
(1, 'Aarav Sharma', 'A101', '2024-01-10', 5000.00, 0.00),
(2, 'Meera Iyer', 'B202', '2024-02-01', 3000.00, 2000.00),
(3, 'Rohan Das', 'C303', '2024-03-15', 6000.00, 0.00),
(4, 'Sana Khan', 'A101', '2024-03-20', 2000.00, 3000.00);
