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

CREATE DATABASE IF NOT EXISTS hostel_management;
USE hostel_management;

### 2.Create Table
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

### Project Structure
HostelWebApp/
├── WebContent/
│   ├── index.jsp
│   ├── studentadd.jsp
│   ├── studentupdate.jsp
│   ├── studentdelete.jsp
│   ├── studentdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│       ├── dao/
│       │   └── HostelDAO.java
│       ├── model/
│       │   └── Student.java
│       └── servlet/
│           ├── AddStudentServlet.java
│           ├── UpdateStudentServlet.java
│           ├── DeleteStudentServlet.java
│           ├── DisplayStudentsServlet.java
│           ├── ReportServlet.java
│           └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml

    └── web.xml

### Installation & Setup
Step 1: Download the Project
Clone or download the project files.

Organize them according to the structure shown above.

Step 2: Configure the Database
Start your MySQL server.

Run the SQL scripts provided above to create and populate the database.

Update your database credentials in HostelDAO.java:
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hostel_management", 
    "your_username", 
    "your_password");

### Step 3: Add MySQL JDBC Driver
Download the MySQL Connector/J

Add the JAR to your project’s WEB-INF/lib directory

If using an IDE like Eclipse, also add it to your project's build path

Step 4: Deploy to Apache Tomcat
Create a Dynamic Web Project in Eclipse or any IDE

Import all project files

Deploy the project to Apache Tomcat

Start the Tomcat server

Step 5: Run the Application
Open a browser and visit:

arduino
Copy code
http://localhost:8080/Hostel/

## 📄 Modules & Functionalities
Module	                    Functionality
StudentAdd	                Register new student entries
StudentUpdate             	Edit student information
StudentDelete	              Remove student records
StudentDisplay	            View all or specific student details
Reports	                    View students with pending fees, by room, or date

## 📊 Reports Available
💸 Students with Pending Fees

🏠 Students in a Particular Room

📅 Students Admitted Between Two Dates

## 🛠️ Technologies Used
Java (JSP + Servlets)

JDBC (MySQL Database connectivity)

MySQL

Apache Tomcat

HTML, CSS (for JSP pages)
