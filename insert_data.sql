INSERT INTO customers VALUES
(1,'Alice','Mumbai'),
(2,'Bob','Delhi'),
(3,'Charlie','Pune'),
(4,'David','Bangalore'),
(5,'Emma','Hyderabad'),
(6,'Frank','Chennai'),
(7,'Grace','Kolkata'),
(8,'Harry','Mumbai'),
(9,'Ivy','Delhi'),
(10,'Jack','Pune');

ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

INSERT INTO products VALUES
(1,'Phone','Electronics',20000),
(2,'Laptop','Electronics',50000),
(3,'Headphones','Electronics',3000),
(4,'TShirt','Fashion',1000),
(5,'Shoes','Fashion',4000),
(6,'Watch','Accessories',5000);

INSERT INTO orders VALUES
(1,1,1,1,'2025-01-05'),
(2,2,2,1,'2025-01-07'),
(3,1,3,2,'2025-01-10'),
(4,3,5,1,'2025-01-12'),
(5,4,4,3,'2025-02-01'),
(6,5,1,2,'2025-02-05'),
(7,2,6,1,'2025-02-10'),
(8,6,2,1,'2025-03-01'),
(9,7,5,2,'2025-03-05'),
(10,8,3,3,'2025-03-10'),
(11,9,1,1,'2025-03-15'),
(12,10,4,2,'2025-03-20'),
(13,5,2,1,'2025-04-01'),
(14,1,6,1,'2025-04-05'),
(15,3,1,1,'2025-04-10');