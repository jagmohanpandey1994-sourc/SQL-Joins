use table pwskills
# Table 1: Customers

Create Table Customers(
Customer_Id int primary key,
Customer_Name varchar(50),
City varchar(50)
);
Insert into customers values
(1,"John Smith","New York"),
(2,"Mary Johnson","Chicago"),
(3,"Peter Adams","Los Angeles"),
(4,"Nancy Miller","Houston"),
(5,"Robert White","Miami");

select * from customers;

# Table 2: Orders

Create Table Orders(
Order_Id int primary key,
Customer_Id int,
Order_date Date,
Amount int
);
Insert into Orders values
(101,1,"2024-10-01",250),
(102,2,"2024-10-05",300),
(103,1,"2024-10-07",150),
(104,3,"2024-10-10",450),
(105,6,"2024-10-12",400);

select * from Orders;

# Table 3: Payments

Create Table Payments (
Payment_Id varchar(10) primary key,
Customer_Id int,
Payment_date Date,
Amount int
);
Insert into Payments values
('P001',1,"2024-10-02",250),
('P002',2,"2024-10-06",300),
('P003',3,"2024-10-11",450),
('P004',4,"2024-10-15",200);

select * from Payments;

# Table 4: Employees

Create Table Employees (
Employee_Id int primary key,
Employees_Name varchar(50),
Manager_ID int
);
Insert into Employees values
(1,"Alex Green",NUPRIMARYPayment_IdCustomer_IdLL),
(2,"Brian Lee",1),
(3,"Carol Ray",1),
(4,"David Kim",2),
(5,"Eva Smith",2);

select * from Employees;

# Question 1. Retrieve all customers who have placed at least one order.
select distinct c.*
from customers c
inner join orders o
on c.customer_id = o.customer_id;

# Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.

SELECT c.Customer_ID, c.Customer_Name, o.Order_ID, o.Order_Date, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

# Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.

SELECT o.Order_ID, o.Order_Date, o.Amount, c.Customer_Name
FROM Orders o
LEFT JOIN Customers c
ON o.Customer_ID = c.Customer_ID;

# Question 4. Display all customers and orders, whether matched or not.

SELECT c.Customer_ID, c.Customer_Name, o.Order_ID, o.Order_Date, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID

UNION

SELECT c.Customer_ID, c.Customer_Name, o.Order_ID, o.Order_Date, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

# Question 5. Find customers who have not placed any orders.

SELECT c.*
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Order_ID IS NULL;

# Question 6. Retrieve customers who made payments but did not place any orders.

SELECT DISTINCT c.Customer_ID, c.Customer_Name
FROM Customers c
INNER JOIN Payments p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Order_ID IS NULL;

# Question 7. Generate a list of all possible combinations between Customers and Orders.

SELECT c.Customer_Name, o.Order_ID
FROM Customers c
CROSS JOIN Orders o;

# Question 8. Show all customers along with order and payment amounts in one table.

SELECT c.Customer_ID, c.Customer_Name,
       o.Order_ID, o.Amount AS OrderAmount,
       p.Payment_ID, p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
LEFT JOIN Payments p
ON c.Customer_ID = p.Customer_ID;

# Question 9. Retrieve all customers who have both placed orders and made payments.

SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
INNER JOIN Payments p
ON c.Customer_ID = p.Customer_ID;