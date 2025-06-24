-- Table: customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    loyalty_status VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'Gold'),
(2, 'Bob Smith', 'Silver'),
(3, 'Charlie Ray', 'Platinum'),
(4, 'Diana Prince', 'Gold'),
(5, 'Ethan Hunt', 'Silver'),
(6, 'Fiona Gallagher', 'Bronze'),
(7, 'George Clooney', 'Platinum'),
(8, 'Hannah Montana', 'Gold'),
(9, 'Ian Malcolm', 'Silver'),
(10, 'Jane Doe', 'Bronze'),
(11, 'Kevin Hart', 'Gold'),
(12, 'Laura Croft', 'Silver'),
(13, 'Michael Scott', 'Bronze'),
(14, 'Nancy Drew', 'Gold'),
(15, 'Oscar Wilde', 'Platinum'),
(16, 'Pam Beesly', 'Silver'),
(17, 'Quentin Blake', 'Bronze'),
(18, 'Rachel Green', 'Gold'),
(19, 'Steve Rogers', 'Platinum'),
(20, 'Tony Stark', 'Gold');

-- Table: products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(30)
);

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics'),
(102, 'Yoga Mat', 'Fitness'),
(103, 'Water Bottle', 'Kitchen'),
(104, 'Laptop Stand', 'Electronics'),
(105, 'Smart Watch', 'Wearables'),
(106, 'Bluetooth Speaker', 'Audio'),
(107, 'Desk Lamp', 'Furniture'),
(108, 'Notebook', 'Stationery'),
(109, 'Pens Pack', 'Stationery'),
(110, 'Backpack', 'Accessories'),
(111, 'Running Shoes', 'Footwear'),
(112, 'Socks', 'Apparel'),
(113, 'T-Shirt', 'Apparel'),
(114, 'Hand Towel', 'Kitchen'),
(115, 'Coffee Mug', 'Kitchen'),
(116, 'Phone Holder', 'Accessories'),
(117, 'USB Cable', 'Electronics'),
(118, 'Extension Cord', 'Electronics'),
(119, 'Face Mask', 'Healthcare'),
(120, 'Sanitizer', 'Healthcare');

-- Table: transactions
CREATE TABLE transactions (
    trans_id INT PRIMARY KEY,
    customer_id INT,
    trans_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO transactions VALUES
(1001, 1, '2024-06-01'),
(1002, 2, '2024-06-02'),
(1003, 3, '2024-06-03'),
(1004, 4, '2024-06-04'),
(1005, 5, '2024-06-05'),
(1006, 6, '2024-06-06'),
(1007, 7, '2024-06-07'),
(1008, 8, '2024-06-08'),
(1009, 9, '2024-06-09'),
(1010, 10, '2024-06-10'),
(1011, 11, '2024-06-11'),
(1012, 12, '2024-06-12'),
(1013, 13, '2024-06-13'),
(1014, 14, '2024-06-14'),
(1015, 15, '2024-06-15'),
(1016, 16, '2024-06-16'),
(1017, 17, '2024-06-17'),
(1018, 18, '2024-06-18'),
(1019, 19, '2024-06-19'),
(1020, 20, '2024-06-20');

-- Table: transaction_items
CREATE TABLE transaction_items (
    trans_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (trans_id) REFERENCES transactions(trans_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO transaction_items VALUES
(1001, 101, 2, 599.00),
(1002, 102, 1, 1299.00),
(1003, 103, 3, 299.00),
(1004, 104, 1, 1599.00),
(1005, 105, 1, 4999.00),
(1006, 106, 2, 1499.00),
(1007, 107, 1, 699.00),
(1008, 108, 5, 99.00),
(1009, 109, 3, 49.00),
(1010, 110, 1, 1999.00),
(1011, 111, 1, 3299.00),
(1012, 112, 6, 149.00),
(1013, 113, 2, 799.00),
(1014, 114, 4, 299.00),
(1015, 115, 2, 249.00),
(1016, 116, 1, 399.00),
(1017, 117, 3, 149.00),
(1018, 118, 1, 799.00),
(1019, 119, 5, 99.00),
(1020, 120, 2, 199.00);
