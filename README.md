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

---





