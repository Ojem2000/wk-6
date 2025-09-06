USE salesdb;
-- Question 1 Employees with Office Info
SELECT 
    e.firstName,
    e.lastName,
    e.email,
    o.officeCode
FROM employees e
INNER JOIN offices o
    ON e.officeCode = o.officeCode;

--Question 2 Products with Product Line Info
SELECT 
    p.productName,    -- Name of the product
    p.productVendor,  -- Vendor/supplier of the product
    pl.productLine    -- Product line category from productlines table
FROM products p
-- LEFT JOIN ensures all products are shown,
-- even if they don't have a matching product line
LEFT JOIN productlines pl
    ON p.productLine = pl.productLine;

--Question 3 Orders with Customer Info
SELECT 
    o.orderDate,      -- Date the order was placed
    o.shippedDate,    -- Date the order was shipped
    o.status,         -- Current order status (e.g., Shipped, Cancelled)
    o.customerNumber  -- The customer who placed the order
FROM customers c
-- RIGHT JOIN ensures all orders are included,
-- even if the customer record is missing (unlikely, but possible)
RIGHT JOIN orders o
    ON c.customerNumber = o.customerNumber
-- Limit results to the first 10 orders
LIMIT 10;
