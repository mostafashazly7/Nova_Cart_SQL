CREATE DATABASE NovaDB;
GO

USE NovaDB;
GO

CREATE TABLE Customers (
	customer_id   INT IDENTITY(1,1) PRIMARY KEY ,
	username      VARCHAR(100) NOT NULL, 
	email         VARCHAR(100) NOT NULL UNIQUE,
	phone         VARCHAR(20)  NOT NULL, 
	adress        VARCHAR(200) NOT NULL,
	join_date     DATETIME     NOT NULL
);
GO

CREATE TABLE Products(
	product_id         INT IDENTITY(1,1) PRIMARY KEY,
    product_name       VARCHAR(50)  NOT NULL,
    product_category   VARCHAR(50)   NOT NULL,
    selling_price      DECIMAL(20,2) NOT NULL CHECK (selling_price >= 0),
    product_quantity   INT           NOT NULL CHECK (product_quantity >= 0)
);
GO


CREATE TABLE Orders (
    order_id    INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT         NOT NULL,
    order_date  DATETIME        NOT NULL,
    status      VARCHAR(30) NOT NULL
        CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
GO



CREATE TABLE Order_Details (
    order_id          INT           NOT NULL,
    poduct_id         INT           NOT NULL,
    selling_price     DECIMAL(10,2) NOT NULL CHECK (selling_price >= 0),  
    required_quantity INT           NOT NULL CHECK (required_quantity > 0),
    PRIMARY KEY (order_id, poduct_id),
    FOREIGN KEY (order_id)  REFERENCES orders(order_id),
    FOREIGN KEY (poduct_id) REFERENCES Products(product_id)
);
GO


CREATE TABLE Payments (
    payment_id     INT IDENTITY(1,1) PRIMARY KEY,
    order_id       INT NOT NULL UNIQUE,
    payment_date   DATETIME,
    amount         DECIMAL(10,2) CHECK (amount > 0),
    payment_method VARCHAR(20)
        CHECK (payment_method IN ('Credit Card', 'PayPal', 'COD')),   
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
GO 


CREATE TABLE Reviews (
    review_id   INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    poduct_id   INT NOT NULL,
    comment     VARCHAR(300) NULL,              
    rating      INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_date DATETIME,
    UNIQUE (customer_id, poduct_id),            
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (poduct_id)   REFERENCES Products(product_id)
);
GO
 