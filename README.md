# PharmaKina - Drug Inventory and Expiry Tracking System
## Author

**Student Name:** Cito Douce Bisusa
**Course:** BEST PROGRAMMING PRACTICES AND DESIGN PATTERNS (SENG 8240)
**Instructor:** RUTARINDWA JEAN PIERRE
**Academic Year:** 2025/2026
**Date:** 14th May 2026

## Project Overview

PharmaKina is a drug inventory management system for a pharmaceutical company in Bukavu, DRC. The system manages drug stocks, tracks sales, monitors expiry dates, and generates alerts for low stock or soon-to-expire medications.

## Problem Statement

The company faces challenges with manual stock management leading to losses, no expiry date tracking, difficulty tracking sales, and no alerts for low stock or expiring drugs.

## Solution

This system provides digital inventory management, automated expiry alerts, sales recording, low stock warnings, and user roles (Admin, Pharmacist, Manager).

## Technologies Used

| Technology | Purpose |
|------------|---------|
| Java Swing | Desktop GUI application |
| Oracle Database 18c XE | Relational database in Docker |
| JDBC | Database connectivity |
| Docker | Containerization for portability |
| Git/GitHub | Version control |

## Docker Installation

### Prerequisites

- Docker Desktop installed (https://docker.com)
- Java 11 or higher
- IntelliJ IDEA

### Step 1: Start Oracle Database with Docker

Open PowerShell and run:



### Step 2: Wait for Database Initialization

Wait 2-3 minutes. Check logs with:


When you see "DATABASE IS READY TO USE", proceed.

### Step 3: Start the Database


### Step 4: Run the Application

1. Open project in IntelliJ IDEA
2. Navigate to src/ui/PharmaKinaGUI.java
3. Right-click and select "Run"

## Login Credentials

| Role | Username | Password | Permissions |
|------|----------|----------|-------------|
| Admin | admin | admin123 | Full access (manage drugs, users, reports) |
| Pharmacist | pharmacist1 | pass123 | Record sales, check stock, view alerts |
| Manager | manager1 | manager123 | View reports, stock alerts |

## Features Explained

### 1. User Authentication
Three user roles with different access levels. Login is validated against the database. Each role has specific permissions.

### 2. Drug Management
View all drugs with their prices, categories, and stock levels. Each drug can have multiple batches with different expiry dates.

### 3. Stock Tracking
Each batch has quantity, expiry date, purchase price, selling price, and storage location. Stock decreases automatically when sales are recorded.

### 4. Sales Recording
Pharmacists can record sales by selecting a drug, entering quantity, and choosing payment method (Cash, Card, etc.). Total price is calculated automatically.

### 5. Expiry Alerts
The system automatically generates alerts for drugs expiring within 30 days:
- CRITICAL: Less than 7 days remaining
- URGENT: 7-15 days remaining
- WARNING: 15-30 days remaining

### 6. Low Stock Alerts
When stock quantity falls below the reorder level, an alert is generated for managers to reorder.

## Docker Commands

| Command | Action |
|---------|--------|
| docker start pharmakina-db | Start database (every morning) |
| docker stop pharmakina-db | Stop database (every evening) |
| docker ps | Check if database is running |
| docker logs pharmakina-db | View database logs |
| docker exec -it pharmakina-db bash | Enter container for debugging |

## Database Schema

| Table | Purpose |
|-------|---------|
| system_users | User accounts, passwords, and roles |
| suppliers | Drug suppliers information |
| drugs | Drug catalog with names, categories, prices |
| drug_batches | Batch numbers, quantities, expiry dates |
| sales | Transaction records with customer names |
| expiry_alerts | Automatic expiration notifications |
| low_stock_alerts | Automatic low stock warnings |

## How to Run on Any Computer

1. Install Docker Desktop
2. Run the docker run command from Step 1 above
3. Clone this repository: git clone https://github.com/citodouce-eng/Pharmakina-system.git
4. Open the project in IntelliJ IDEA
5. Run ui/PharmaKinaGUI.java

The Docker container makes Oracle database work on Windows, Mac, or Linux without manual database installation.

## Testing

| Test Case | Expected Result | Status |
|-----------|-----------------|--------|
| Valid admin login (admin/admin123) | Dashboard opens | PASS |
| Invalid login (wrong password) | Error message displayed | PASS |
| Record a sale | Stock decreases, sale saved | PASS |
| Low stock alert | Alert generated | PASS |
| Expiry date less than 30 days | Alert displayed | PASS |
| Add new drug | Drug appears in list | PASS |


## Troubleshooting

### Database connection fails
- Check if Docker is running: docker ps
- Restart database: docker start pharmakina-db
- Verify port 1522 is not blocked

### Login fails
- Use correct credentials: admin/admin123
- Check if tables are created in database

### Application won't compile
- Ensure JDBC driver (ojdbc11.jar) is in lib folder
- Add library to IntelliJ: File -> Project Structure -> Libraries -> Add -> ojdbc11.jar


## Conclusion

PharmaKina successfully addresses the inventory management needs of the pharmaceutical company. The system is containerized with Docker, making it portable across different environments. It implements proper design patterns (Singleton, DAO, MVC) and follows best programming practices with meaningful naming, code organization, and documentation.




