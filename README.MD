# SQL Data Engineering Project

## 1. Project Overview

This project demonstrates SQL data engineering workflow using sales data, including schema design, data validation, relational modelling, data loading and analytical queries.

## 2. Project Objective

The objective is to transform raw sales data into a structured relational database and perform business analysis using SQL.


## 3. Project Workflow

```
Raw CSV
   ↓
Schema Design
   ↓
Validation
   ↓
Dimension Tables
   ↓
Fact Table
   ↓
SQL Analysis
```


## 4. Project Structure
```
SQL_Project/
│
├── data/
│   └── raw_data.csv
│
├── diagrams/
│   ├── ERD.mwb
│   └── ERD.png
│
├── schema.sql
├── insert_data.sql
├── analysis.sql
└── README.md
```   

## 5. Database Design

- DimCustomer
- DimProduct
- DimCategory
- DimDate
- InvoiceFact


## 6. Data Validation

- Primary Keys
- Foreign Keys
- Data types
- Referential integrity
- Duplicate prevention through dimension loading logic


## 7. SQL Analysis

1. Top Customer by Total Sales
2. Top Product by Total Sales
3. Total Sales by Category
4. Total Sales by City
5. Monthly Sales Trend
6. Top 3 Products by Quantity Sold


## 8. SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- INSERT
- JOIN
- GROUP BY
- ORDER BY

## 9. Tools Used

- MySQL
- MySQL Workbench
- VS Code
- Git/GitHub


## 10. How to Run

1. Open MySQL Workbench.
2. Run schema and insert_data.sql.
3. Run analysis.sql.

## 11. Future Improvements

- Add incremental data loading
- Add automated data quality checks
- Add Python-based ETL pipeline
- Integrate Power BI for interactive dashboards

## Author

**Akshay Gawand**