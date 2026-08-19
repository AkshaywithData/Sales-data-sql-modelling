use newsales;

show tables;

#1 customer generated highest sale

SELECT c.Customer, SUM(f.Amount) AS TotalSales
FROM InvoiceFact f
JOIN DimCustomer c
ON f.CustomerID = c.CustomerID
GROUP BY c.Customer
ORDER BY TotalSales DESC
LIMIT 1;

#2 Product generated highest sale

SELECT p.Product, SUM(f.Amount) AS TotalSales
FROM InvoiceFact f
JOIN DimProduct p
ON f.ProductID = p.ProductID
GROUP BY p.Product
ORDER BY TotalSales DESC
LIMIT 1;

#3 total sales by category

SELECT c.Category, SUM(f.Amount) AS TotalSales
FROM InvoiceFact f
JOIN DimProduct p
ON f.ProductID = p.ProductID
JOIN DimCategory c
ON p.CategoryID = c.CategoryID
GROUP BY c.Category
ORDER BY TotalSales DESC;

#4 total sales by city
SELECT c.City,SUM(f.Amount) AS TotalSales
FROM InvoiceFact f
JOIN DimCustomer c
ON f.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY TotalSales DESC;

#5 monthly sales
SELECT d.Year, d.Month,SUM(f.Amount) AS TotalSales
FROM InvoiceFact f
JOIN DimDate d
ON f.DateID = d.DateID
GROUP BY d.Year, d.Month;

#6 top 3 selling product by quantity
SELECT p.Product,SUM(f.Quantity) AS TotalQuantity
FROM InvoiceFact f
JOIN DimProduct p
ON f.ProductID = p.ProductID
GROUP BY p.Product
ORDER BY TotalQuantity DESC
LIMIT 3;