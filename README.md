# Online Retail Store SQL Analysis

## Project Overview

This project analyzes data from an Online Retail Store using SQL. It focuses on customer activity, product performance, orders, sales, and spending patterns.

The project uses a relational database containing three main tables: **Customers, Products, and Orders**. SQL queries are organized from core SQL concepts to more advanced analytical techniques, including **Subqueries, Common Table Expressions (CTEs), and Window Functions**.

The analysis answers a range of business-related questions and demonstrates how SQL can be used to retrieve, transform, and analyze data from multiple related tables.

---

## Database Structure

The database consists of three tables.

### Customers

Stores customer information.

| Column          | Description                         |
| --------------- | ----------------------------------- |
| `customer_id`   | Unique identifier for each customer |
| `customer_name` | Customer name                       |
| `city`          | Customer's city                     |
| `gender`        | Customer's gender                   |
| `age`           | Customer's age                      |

### Products

Stores product information.

| Column           | Description                        |
| ---------------- | ---------------------------------- |
| `product_id`     | Unique identifier for each product |
| `product_name`   | Product name                       |
| `category`       | Product category                   |
| `price`          | Product price                      |

### Orders

Stores order information.

| Column        | Description                      |
| ------------- | -------------------------------- |
| `order_id`    | Unique identifier for each order |
| `customer_id` | Customer who placed the order    |
| `product_id`  | Product included in the order    |
| `quantity`    | Quantity ordered                 |
| `order_date`  | Date the order was placed        |

### Relationships

```text
Customers
    │
    │ customer_id
    ▼
Orders
    ▲
    │ product_id
    │
Products
```

* A customer can place multiple orders.
* A product can appear in multiple orders.
* The `Orders` table connects customers and products.

---

## SQL Skills Demonstrated

### Core SQL

* SELECT and DISTINCT
* Filtering with WHERE
* AND, OR, and NOT
* IN, BETWEEN, and LIKE
* ORDER BY and LIMIT
* Aggregate functions: COUNT(), SUM(), AVG(), MIN(), MAX()
* GROUP BY and HAVING

### Joins

* INNER JOIN
* LEFT JOIN
* Multi-table joins

### Other SQL Concepts

* CASE statements
* Views
* Indexes

### Subqueries

* Scalar subqueries
* IN and NOT IN subqueries
* Correlated subqueries
* Derived tables

### Common Table Expressions (CTEs)

* Simple CTEs
* Multiple CTEs
* Dependent CTEs
* Multi-step analysis

### Window Functions

* OVER()
* PARTITION BY
* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* Aggregate window functions
* Running totals
* Running averages

---

## Analysis Areas

The project includes analysis related to:

* Customer purchasing behavior
* Customer spending and order activity
* Product and category performance
* Sales and revenue calculations
* Product and customer rankings
* Comparison with average values
* Customers and products meeting specific conditions
* Order sequencing
* Running sales and spending analysis

---

## Project Structure

```text
Online-Retail-Store-SQL-Analysis/
│
├── README.md
├── 01_database_setup.sql
├── 02_basic_queries.sql
├── 03_joins.sql
├── 04_case_views_indexes.sql
├── 05_subqueries.sql
├── 06_ctes.sql
└── 07_window_functions.sql
```

---

## Tools Used

* MySQL
* MySQL Workbench
* GitHub

---

## Author

**Moiz Gaddafi**

Aspiring Business/Data Analyst

