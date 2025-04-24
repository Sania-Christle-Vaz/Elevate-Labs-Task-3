# Elevate-Labs-Task-3
#  SQL for Data Analysis 

This mini project demonstrates basic to intermediate SQL skills using a simple sales dataset. It includes table creation, data insertion, and various SQL queries for analysis.

## Tool Used

- **SQL Server** (via OneCompiler or local setup)

---

## Tables

### 1. `sales`

| Column            | Type         | Description                  |
|------------------|--------------|------------------------------|
| `ID`              | INT          | Primary Key                  |
| `product_category`| VARCHAR(20)  | Type of product              |
| `quantity`        | INT          | Quantity sold                |
| `cost`            | DECIMAL(4,2) | Cost per unit (unique)       |

### 2. `suppliers`

| Column            | Type          | Description                  |
|------------------|---------------|------------------------------|
| `supplier_id`     | INT           | Primary Key                  |
| `supplier_name`   | VARCHAR(50)   | Name of the supplier         |
| `contact_email`   | VARCHAR(50)   | Email contact                |
| `location`        | VARCHAR(30)   | Supplier's location          |
| `product_category`| VARCHAR(20)   | Related product category     |

---

## SQL Concepts Demonstrated

- Basic commands: `SELECT`, `INSERT`, `ORDER BY`, `GROUP BY`, `WHERE`
- Joins: `INNER JOIN`
- Aggregate functions: `SUM()`, `AVG()`
- Subqueries
- Conditional logic with `CASE`
- Indexing for optimization using `CREATE INDEX`

---

## Sample Queries

### Total Quantity by Product
```sql
SELECT product_category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_category;
