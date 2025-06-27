USE alx_book_store;



CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL, 
    author_id INT,
    ISBN VARCHAR(20),
    price DECIMAL(10, 2),
    CONSTRAINT fk_book_author Foreign Key (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(30),
    email VARCHAR(255),
    phone VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total DECIMAL(10, 2),
    CONSTRAINT fk_orders_customer Foreign Key (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    book_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    CONSTRAINT fk_od_order Foreign Key (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_od_customer Foreign Key (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_od_book Foreign Key (book_id) REFERENCES Books(book_id)
);


ALTER TABLE Customers DROP COLUMN phone;


