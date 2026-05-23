# End-to-End Financial Analytics & Debt Management Pipeline
### Scaling from Excel Dashboards to MySQL Relational Databases

## Table of Contents
* [📌 Project Overview](#-project-overview)
* [📊 Phase 1: Excel Analytics](#-phase-1-excel-analytics)
* [💻 Phase 2: MySQL Migration](#-phase-2-mysql-migration)
* [📈 Visual Proof (SQL Results)](#-visual-proof-sql-results)
* [📊 Technical Comparison](#-technical-comparison-logic-transformation)
* [📁 Repository Structure](#-repository-structure)

## 📌 Project Overview
This project showcases the evolution of a financial tracking system designed to monitor liabilities and Debt-to-Income (DTI) trends for 2026-2027. It demonstrates a full data lifecycle: starting with **Data Visualization in Excel** and transitioning into **Data Engineering in MySQL** for professional-grade accuracy and automation.

---

## 📊 Phase 1: Excel Analytics
**Goal:** Create an immediate visual tool for tracking debt repayment strategies.
* **Features:** Integrated DTI monitoring, conditional formatting alerts, and interactive burndown charts.
* **Key Metric:** Established a 43% DTI risk threshold to guide monthly cash flow management.



---

## 💻 Phase 2: MySQL Migration
**Goal:** Transition from a flat-file spreadsheet to a relational database to handle 200+ records with 100% mathematical precision.
* **Database Design:** Engineered three relational tables (`tracker`, `summary_of_payments`, `debt_progress`) using `DECIMAL` types to eliminate rounding errors.
* **Automation:** Developed **SQL Views** to generate real-time reports, allowing for instant filtering of unpaid liabilities.



---

## 📈 Visual Proof (SQL Results)
To verify the accuracy of the database migration, the following queries were implemented to provide high-level insights:

* **Active Debt Tracker**: Filtered view showing only 'NO' status payments.
* **Debt Mountain Priority**: Grouped summary showing total unpaid balances per item.
* **Payment Progress**: Historical log of payments vs. remaining balances.

> **Note:** See the `Phase-2-MySQL-Migration` folder for full-size screenshots of `PAID.png`, `UNPAID.png`, and `INSTALLMENT_LEFTS.png`.

---

## 📊 Technical Comparison: Logic Transformation
| Feature | Excel Method | MySQL Query Equivalent |
| :--- | :--- | :--- |
| **Data Storage** | Static Worksheet | Relational Table |
| **Summing Debt** | `=SUM(C2:C20)` | `SELECT SUM(amount) FROM tracker;` |
| **DTI Calculation**| `=Debt / Income` | `SELECT (SUM(amount) / income) FROM summary;` |
| **Active Filters** | Manual Data Filter | `WHERE paid = 'NO'` |
| **Categorization** | Pivot Table | `GROUP BY item` |

---

## 📁 Repository Structure
```text
├── Phase-1-Excel-Analytics/
│   ├── Financial_Analytics_Dashboard_2026.xlsx  
│   └── DASHBOARD.png                            
├── Phase-2-MySQL-Migration/
│   ├── financial_dashboard.sql                  
│   ├── PAID.png
│   ├── UNPAID.png
│   ├── DEBT_PROGRESS.png
│   ├── PAYMENTS_REMAINING.png
│   └── INSTALLMENT_LEFTS.png
└── README.md
