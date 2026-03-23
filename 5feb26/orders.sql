CREATE TABLE customers (
    cus_id BIGINT PRIMARY KEY,
    cus_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    prod_name VARCHAR(100) UNIQUE NOT NULL,
    prod_price DECIMAL(10,2) NOT NULL,
    model_year INT
);
CREATE TABLE orders (
    ord_id BIGINT PRIMARY KEY,
    cus_id BIGINT NOT NULL,
    date_ordered DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (cus_id)
        REFERENCES customers(cus_id)
);
CREATE TABLE order_items (
    ord_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (ord_id, product_id),
    CONSTRAINT fk_oi_order
        FOREIGN KEY (ord_id)
        REFERENCES orders(ord_id),
    CONSTRAINT fk_oi_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE suppliers (
    supplier_id BIGINT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);
ALTER TABLE products
ADD supplier_id BIGINT NULL;
ALTER TABLE products
ADD CONSTRAINT fk_products_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);
select * from products;
INSERT INTO suppliers (supplier_id, supplier_name, email, phone, city)
VALUES
(69876545501, 'ABC Electronics',   'abc@gmail.com',      '9045454201', 'Hyderabad'),
(69876545502, 'TechWorld Pvt Ltd', 'tech@gmail.com',     '9045454202', 'Bangalore'),
(69876545503, 'Home Appliances',  'home@gmail.com',     '9045454203', 'Chennai'),
(69876545504, 'Office Solutions', 'office@gmail.com',   '9045454204', 'Pune'),
(69876545505, 'Network Systems',  'network@gmail.com',  '9045454205', 'Delhi');

UPDATE products
SET supplier_id = 69876545501
WHERE product_id IN (
    79876545501, 
    79876545502, 
    79876545503, 
    79876545506, 
    79876545507  
);
UPDATE products
SET supplier_id = 69876545502
WHERE product_id IN (
    79876545504, 
    79876545505, 
    79876545508  
);
UPDATE products
SET supplier_id = 69876545503
WHERE product_id IN (
    79876545509, 
    79876545511, 
    79876545512  
);
UPDATE products
SET supplier_id = 69876545504
WHERE product_id IN (
    79876545510 
);
SELECT
    p.product_id,
    p.prod_name,
    p.supplier_id,
    s.supplier_name
FROM products p
JOIN suppliers s
    ON p.supplier_id = s.supplier_id
ORDER BY p.product_id;

ALTER TABLE products
ALTER COLUMN supplier_id BIGINT NOT NULL;

ALTER TABLE products
ADD CONSTRAINT fk_products_supplier
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id);



INSERT INTO customers VALUES
(99876545501, 'Sushnath Reddy', 'sushnath.reddy@gmail.com', 'Hyderabad'),
(99876545502, 'Rishanth Reddy', 'rishanth.reddy@gmail.com', 'Bangalore'),
(99876545503, 'Thirupathi Reddy', 'thirupathi.reddy@gmail.com', 'Tirupati'),
(99876545504, 'Nanda Reddy', 'nanda.reddy@gmail.com', 'Kadapa'),
(99876545505, 'Navneeth Reddy', 'navneeth.reddy@gmail.com', 'Chennai'),
(99876545506, 'Jayanth', 'jayanth@gmail.com', 'Hyderabad'),
(99876545507, 'Akshanth', 'akshanth@gmail.com', 'Warangal'),
(99876545508, 'Uma', 'uma@gmail.com', 'Vijayawada'),
(99876545509, 'Usha', 'usha@gmail.com', 'Rajahmundry'),
(99876545510, 'Kousalya', 'kousalya@gmail.com', 'Visakhapatnam');

INSERT INTO products VALUES
(79876545501, 'Laptop', 55000.00, 2024),
(79876545502, 'Mobile Phone', 25000.00, 2023),
(79876545503, 'Headphones', 3000.00, 2022),
(79876545504, 'Keyboard', 1500.00, 2023),
(79876545505, 'Mouse', 800.00, 2024),
(79876545506, 'Smart Watch', 12000.00, 2023),
(79876545507, 'Tablet', 22000.00, 2022),
(79876545508, 'Monitor', 18000.00, 2024),
(79876545509, 'Printer', 16000.00, 2021),
(79876545510, 'Router', 4000.00, 2022);

SELECT product_id FROM products ORDER BY product_id;

INSERT INTO orders VALUES
(89876545501, 99876545501, '2025-01-05'),
(89876545502, 99876545502, '2025-01-07'),
(89876545503, 99876545503, '2025-01-10'),
(89876545504, 99876545504, '2025-01-12'),
(89876545505, 99876545505, '2025-01-15'),
(89876545506, 99876545506, '2025-01-18'),
(89876545507, 99876545507, '2025-01-20'),
(89876545508, 99876545508, '2025-01-22'),
(89876545509, 99876545509, '2025-01-25'),
(89876545510, 99876545510, '2025-01-28');

INSERT INTO order_items VALUES
(89876545501, 79876545501, 1),
(89876545501, 79876545505, 2),
(89876545502, 79876545502, 1),
(89876545503, 79876545503, 2),
(89876545504, 79876545504, 1),
(89876545505, 79876545506, 1),
(89876545506, 79876545507, 1),
(89876545507, 79876545508, 2),
(89876545508, 79876545509, 1),
(89876545509, 79876545510, 3),
(89876545510, 79876545501, 1);

select * from customers;
select * from products;
select * from orders;
select * from order_items;


INSERT INTO customers VALUES
(99876545512, 'komara Reddy', 'komara.reddy@gmail.com', 'Hyderabad');

INSERT INTO products VALUES
(79876545511, 'Charger', 500, 2020),
(79876545512, 'Rice Cooker', 1500, 2021);

INSERT INTO order_items VALUES
(89876545511, 79876545501, 1);






SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM suppliers;



--Customers with their orders
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id;
---Orders with customer name and city
SELECT c.cus_id,c.cus_name,c.city,od.ord_id FROM customers c JOIN orders od ON c.cus_id=od.cus_id;
----Orders with products (3-table join)
SELECT * FROM products p JOIN order_items ot ON p.product_id=ot.product_id JOIN orders od ON ot.ord_id=od.ord_id;
---Filter joined rows using WHERE amount > X
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id JOIN products p ON ot.product_id=p.product_id WHERE p.prod_price>15000;
----Filter joined rows using LIKE pattern
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id JOIN products p ON ot.product_id=p.product_id WHERE p.prod_name LIKE '%a%';
----All customers with orders including NULLs
SELECT * FROM customers c LEFT JOIN orders od ON c.cus_id=od.cus_id;
---Customers without orders
SELECT * FROM customers c LEFT JOIN orders od ON c.cus_id=od.cus_id WHERE od.ord_id IS NULL;
---Products not ordered
SELECT * FROM products p LEFT JOIN order_items ot ON p.product_id=ot.product_id WHERE ot.product_id IS NULL;
---LEFT JOIN with WHERE filter
SELECT * FROM customers c LEFT JOIN orders od ON c.cus_id=od.cus_id LEFT JOIN order_items ot ON od.ord_id=ot.ord_id LEFT JOIN products p ON ot.product_id=p.product_id WHERE p.prod_price>15000;
---LEFT JOIN with LIKE filter
SELECT * FROM customers c LEFT JOIN orders od ON c.cus_id=od.cus_id LEFT JOIN order_items ot ON od.ord_id=ot.ord_id LEFT JOIN products p ON ot.product_id=p.product_id WHERE p.prod_name LIKE '%m%';
---All orders with customer info
SELECT * FROM customers c RIGHT JOIN orders od ON od.cus_id=c.cus_id;
---Orders without matching customers
SELECT * FROM orders od RIGHT JOIN customers c ON od.cus_id=c.cus_id;
----Combine all customers and orders
SELECT * FROM customers c FULL OUTER JOIN orders od ON c.cus_id=od.cus_id;
---All customer–product combinations
SELECT * FROM customers c FULL OUTER JOIN orders od ON c.cus_id=od.cus_id FULL OUTER JOIN order_items ot ON od.ord_id=ot.ord_id FULL OUTER JOIN products p ON ot.product_id=p.product_id;
---customers + orders + order_items
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id;
---orders + products + suppliers
SELECT * FROM order_items ot  JOIN products p ON ot.product_id=p.product_id JOIN suppliers s ON p.supplier_id=s.supplier_id;
---Order count per customer(doubt)
SELECT c.cus_id,c.cus_name,COUNT(od.ord_id) AS order_per_cus FROM customers c LEFT JOIN orders od ON c.cus_id=od.cus_id GROUP BY c.cus_id,c.cus_name;
--Total order amount per customer
SELECT c.cus_id,c.cus_name,SUM(p.prod_price*ot.quantity)  FROM customers c  JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id JOIN products p ON ot.product_id=p.product_id GROUP BY c.cus_id,c.cus_name;
---Product order count
SELECT p.prod_name,COUNT(*) no_of_products_ordered FROM order_items ot JOIN products p ON ot.product_id=p.product_id GROUP BY p.prod_name;
---Customers with more than 1 orders
SELECT c.cus_id,c.cus_name,COUNT(*) AS order_per_cus FROM customers c JOIN orders od ON c.cus_id=od.cus_id GROUP BY c.cus_id,c.cus_name HAVING COUNT(*) >1;
---Products ordered more than 1 times
SELECT p.prod_name,COUNT(*) no_of_products_ordered FROM order_items ot JOIN products p ON ot.product_id=p.product_id GROUP BY p.prod_name HAVING COUNT(*)>1;
---Customers with total order value > X
SELECT c.cus_id,c.cus_name,SUM(p.prod_price*ot.quantity) FROM customers c  JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id JOIN products p ON ot.product_id=p.product_id GROUP BY c.cus_id,c.cus_name HAVING SUM(p.prod_price*ot.quantity) >50000;
--Count orders per city
SELECT c.city,COUNT(*) AS orders_per_city FROM customers c JOIN orders od ON c.cus_id=od.cus_id GROUP BY c.city;
---Orders after certain date with customer data
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id WHERE od.date_ordered>'2025-01-07';
---Customers from specific city with orders
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id JOIN order_items ot ON od.ord_id=ot.ord_id JOIN products p ON ot.product_id=p.product_id WHERE c.city='Hyderabad';
---Products above certain price in orders
SELECT DISTINCT p.prod_name,ot.ord_id FROM products p JOIN order_items ot ON p.product_id=ot.product_id WHERE p.prod_price>15000;
---Customers starting with ‘A’ with orders
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id WHERE c.cus_name LIKE 'a%';
----Products LIKE filter with order data
SELECT * FROM products p LEFT JOIN order_items ot ON p.product_id=ot.product_id JOIN orders od ON ot.ord_id=od.ord_id ORDER BY od.date_ordered DESC; 
-----Customers whose id IN (select customer_id from orders)
SELECT * FROM customers WHERE cus_id IN (SELECT c.cus_id FROM customers c JOIN orders od ON c.cus_id=od.cus_id);
----Customers whose id NOT IN (select customer_id from orders)
SELECT * FROM customers WHERE cus_id NOT IN (SELECT c.cus_id FROM customers c JOIN orders od ON c.cus_id=od.cus_id);
---Products NOT IN ordered products list
SELECT * FROM products WHERE product_id NOT IN (SELECT p.product_id FROM products p JOIN order_items ot ON p.product_id=ot.product_id);
---Orders where amount > (subquery average amount)
SELECT * FROM products p JOIN order_items ot ON p.product_id=ot.product_id WHERE p.prod_price>(SELECT AVG(p.prod_price) FROM products p JOIN order_items ot ON p.product_id=ot.product_id);
---Customers who placed orders above average order value
SELECT * FROM customers c JOIN orders od ON c.cus_id=od.cus_id WHERE od.ord_id IN (SELECT ot.ord_id FROM products p JOIN order_items ot ON p.product_id=ot.product_id WHERE p.prod_price>(SELECT AVG(p.prod_price) FROM products p JOIN order_items ot ON p.product_id=ot.product_id));
/*customers NOT IN cancelled orders list
Use subquery inside JOIN condition
Use subquery as derived table and join it*/

--Use EXISTS to find customers with orders
SELECT * FROM customers c WHERE EXISTS (SELECT * FROM orders o WHERE o.cus_id = c.cus_id);
--Use NOT EXISTS to find customers without order
SELECT * FROM customers c WHERE NOT EXISTS (SELECT * FROM orders o WHERE o.cus_id = c.cus_id);



