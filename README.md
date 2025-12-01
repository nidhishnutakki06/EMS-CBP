# 🎪 Event Management System — DBMS Course-Based Project (CBP)

This repository contains the complete **database implementation** (schema, sample data, queries, triggers, procedures, and views) for our **Event Management System** created as part of the **DBMS Course Based Project (CBP)**.

All SQL code was developed and tested on **OneCompiler (MySQL)**.  
Source workspace: https://onecompiler.com/mysql/444cg2atq

---

## 📌 Repository Contents

| File | Description |
|------|-------------|
| **schema_and_data.sql** | Contains all `CREATE TABLE` statements + all `INSERT` data needed to fully recreate the database. |
| **queries_and_triggers.sql** | Contains all commented queries, triggers, cursors, stored procedures, helper queries, and views. |
| **README.md** | Documentation for running, testing, and understanding the project. |

---

## 🏗️ Database Overview

The project models a complete event-management system including:

- Organizers, Admins, Managers  
- Venues and Events  
- Sub-events  
- Attendees and Registrations  
- Event Status tracking  
- QR Scanning  
- Friend Tracking (location-based sharing)  
- Role Assignments  

### System supports:
✔ Creating & tracking events  
✔ Managing roles & responsibilities  
✔ Attendee registration & check-in  
✔ QR verification  
✔ Viewing event statistics  
✔ Using procedures, triggers & views for automation

---

## ▶️ How to Run This Project (MySQL / OneCompiler / Workbench)

### **1️⃣ Create and select a database**
```sql
CREATE DATABASE event_management;
USE event_management;

SOURCE schema_and_data.sql;
SOURCE queries_and_triggers.sql;
```
---

## 👥 Team Members

- **Name:** Nidhish Nutakki  
  **Roll Number:** 24071A3245  
  **Course / Section:** CSBS  

- **Name:** Metta Kumudini  
  **Roll Number:** 24071A3242  
  **Course / Section:** CSBS  

- **Name:** Nunavath Jyoshna  
  **Roll Number:** 24071A3246  
  **Course / Section:** CSBS  

- **Name:** Mohammed Sameeruddin  
  **Roll Number:** 24071A3243  
  **Course / Section:** CSBS  

- **Name:** P Chandrakath  
  **Roll Number:** 25075A3204  
  **Course / Section:** CSBS  



## 🛠️ Technologies Used

- **MySQL 8.x** — Database engine used for all tables, queries, triggers, and procedures  
- **OneCompiler (Online MySQL IDE)** — Used for development and testing  
- **GitHub** — Version control and project submission platform  
- **Markdown (README.md)** — For documentation  


## 🎯 Purpose of the Project

The main objective of this DBMS Course-Based Project (CBP) is to apply database concepts to a real-world system.  
This project demonstrates:

- Designing a relational database from scratch  
- Creating normalized tables with relationships  
- Implementing primary & foreign keys, constraints, and integrity rules  
- Writing SQL queries for event-based data retrieval  
- Using advanced SQL concepts: triggers, views, procedures, and cursors  
- Managing real-time event workflows such as registrations, QR scans, and attendee tracking  
- Understanding how DBMS supports full-scale applications  

## ✔️ Submission

https://github.com/nidhishnutakki06/EMS-CBP







