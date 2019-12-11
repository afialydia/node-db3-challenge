-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.


SELECT 
p.ProductName, 
c.CategoryName 
FROM Product as p 
JOIN Category as c 
ON c.Id = p.CategoryId;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, o.ShipName
FROM [Order] as o
where o.OrderDate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT 
d.Quantity, 
d.OrderId,
p.ProductName
FROM OrderDetail as d 
JOIN Product as p
on d.orderId = '10251'
where p.id = d.ProductID;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT
o.Id AS OrderId, 
c.CompanyName AS [Company Name], 
e.LastName as [Last Name]
FROM [order] as o 
JOIN Customer as c
JOIN Employee as e 
on  o.employeeId = E.Id
where o.CustomerId = c.Id