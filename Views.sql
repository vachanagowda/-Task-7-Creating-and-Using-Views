-- Drop tables if they already exist
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);
-- Insert Customers
INSERT INTO Customers (CustomerID, CustomerName, Email, Country)
VALUES 
(1, 'Alice Smith', 'alice@example.com', 'USA'),
(2, 'Bob Johnson', 'bob@example.com', 'Canada'),
(3, 'Charlie Brown', 'charlie@example.com', 'USA'),
(4, 'Anna', 'anna@example.com', 'Germany'),
(5, 'Alexa', 'alexa@example.com', 'UK');


-- Insert Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-09-01', 500.00),
(102, 1, '2023-09-10', 1200.00),
(103, 2, '2023-09-15', 750.00),
(104, 3, '2023-09-20', 150.00),
(105, 3, '2023-09-22', 3000.00);

--View: Customers from USA
CREATE VIEW US_Customers AS
SELECT CustomerID, CustomerName, Email
FROM Customers
WHERE Country = 'USA';
select * from US_Customers;

--View: High Value Orders (TotalAmount above 1000)
CREATE VIEW HighValueOrders AS
SELECT OrderID, CustomerID, OrderDate, TotalAmount
FROM Orders
WHERE TotalAmount > 1000;
select * from HighValueOrders;

--View: Customer Order Summary (Join View)
CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
select * from CustomerOrderSummary;


--Update Data Using a View 
UPDATE US_Customers
SET Email = 'alice_new@example.com'
WHERE CustomerID = 1;
