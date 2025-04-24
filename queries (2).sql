
--This creates our first table.
create table sales
( ID int primary key,
product_category varchar(20),
quantity int,
cost decimal(4,2) unique
);

insert into sales (ID, product_category, quantity, cost)
  values (1,"bottle", 7, 45.78),
    (2,"pen", 9, 15.70),
    (3,"scissors", 11, 33.00),
    (4,"match_box", 15, 5.78),
    (5,"books", 10, 85.83);
    
select * from sales;

--This creates our second table.
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_email VARCHAR(50),
    location VARCHAR(30),
    product_category VARCHAR(20)
);

INSERT INTO suppliers (supplier_id, supplier_name, contact_email, location, product_category)
VALUES 
    (1, 'Apex Distributors', 'contact@apex.com', 'Bangalore', 'pen'),
    (2, 'Elite Supplies', 'info@elite.com', 'Mumbai', 'bottle'),
    (3, 'Paper & Co', 'hello@paperco.com', 'Delhi', 'books'),
    (4, 'Sharp Edge Ltd.', 'support@sharpedge.com', 'Hyderabad', 'scissors'),
    (5, 'Spark Traders', 'spark@spark.com', 'Chennai', 'match_box');

Select * from suppliers;

--This query will return all products sorted by cost in descending order.
SELECT product_category, quantity, cost
FROM sales
ORDER BY cost DESC;

--This will give you the total quantity of each product category.
SELECT product_category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_category;

--This will show sales details along with the supplier name and location for each product category.
SELECT 
    s.product_category, 
    s.quantity, 
    s.cost, 
    sp.supplier_name, 
    sp.location
FROM sales s
JOIN suppliers sp
ON s.product_category = sp.product_category;

--This query compares the quantity of each product with the quantity of "pen" and returns products with a higher quantity.
SELECT product_category, quantity
FROM sales
WHERE quantity > (SELECT quantity FROM sales WHERE product_category = 'pen');

--This will return the sum of cost for each product_category.
SELECT product_category, SUM(cost) AS total_cost
FROM sales
GROUP BY product_category;

--This will give you the average quantity for each product_category.
SELECT product_category, AVG(quantity) AS avg_quantity
FROM sales
GROUP BY product_category;



--This will improve the performance of queries filtering by product_category.
CREATE INDEX idx_product_category
ON sales (product_category);
SELECT product_category, SUM(quantity)
FROM sales
WHERE product_category = 'pen'
GROUP BY product_category;

---- This query selects the ID, product category, and quantity from the sales table,
-- and adds a new column called 'range' that categorizes quantity into:
-- 'low' (less than 8), 'average' (8 to 13), and 'high' (14 or more)

select ID, product_category, quantity,
case
  when quantity<8 then "low"
  when quantity>= 8 and quantity<14 then "average"
  else "high"
end as range
from sales;
