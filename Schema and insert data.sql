create database newsales;
use newsales;
CREATE TABLE RawSales (
    InvoiceID INT,
    SaleDate DATE,
    Customer VARCHAR(100),
    City VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(100),
    Quantity INT,
    Amount DECIMAL(12,2)
);

INSERT INTO RawSales
(InvoiceID, SaleDate, Customer, City, Product, Category, Quantity, Amount)
VALUES
(1001,'2026-03-01','ABC Ltd','Mumbai','Laptop','Electronics',2,80000),
(1002,'2026-03-01','XYZ Pvt Ltd','Pune','Mouse','Accessories',5,5000),
(1003,'2026-03-02','ABC Ltd','Mumbai','Keyboard','Accessories',3,4500),
(1004,'2026-03-02','PQR Ltd','Nashik','Laptop','Electronics',1,40000),
(1005,'2026-03-03','XYZ Pvt Ltd','Pune','Monitor','Electronics',2,30000),
(1006,'2026-03-03','ABC Ltd','Mumbai','Mouse','Accessories',10,10000),
(1007,'2026-03-04','LMN Ltd','Nagpur','Printer','Electronics',1,18000),
(1008,'2026-03-04','PQR Ltd','Nashik','Keyboard','Accessories',4,6000),
(1009,'2026-03-05','XYZ Pvt Ltd','Pune','Laptop','Electronics',2,80000),
(1010,'2026-03-05','LMN Ltd','Nagpur','Mouse','Accessories',8,8000),
(1011,'2026-03-06','ABC Ltd','Mumbai','Monitor','Electronics',1,15000),
(1012,'2026-03-06','PQR Ltd','Nashik','Mouse','Accessories',6,6000),
(1013,'2026-03-07','LMN Ltd','Nagpur','Laptop','Electronics',1,40000),
(1014,'2026-03-07','XYZ Pvt Ltd','Pune','Keyboard','Accessories',5,7500),
(1015,'2026-03-08','ABC Ltd','Mumbai','Printer','Electronics',2,36000),
(1016,'2026-03-08','PQR Ltd','Nashik','Monitor','Electronics',3,45000),
(1017,'2026-03-09','LMN Ltd','Nagpur','Keyboard','Accessories',2,3000),
(1018,'2026-03-09','XYZ Pvt Ltd','Pune','Printer','Electronics',1,18000),
(1019,'2026-03-10','ABC Ltd','Mumbai','Laptop','Electronics',1,40000),
(1020,'2026-03-10','PQR Ltd','Nashik','Mouse','Accessories',10,10000);

#category
create table DimCategory(
categoryid int primary key auto_increment,
category varchar(50));

insert into Dimcategory(category)
select distinct Category from rawsales;

#product
create table Dimproduct
(productid int primary key auto_increment,
product varchar(50),
categoryid int,
foreign key(categoryid) references Dimcategory(categoryid));

insert into dimproduct(product, categoryid)
select distinct r.product, c.categoryid from rawsales r 
join dimcategory c
on r.category = c.category;

#customer 
create table Dimcustomer
(Customerid int auto_increment primary key,
customer varchar(50),
city varchar(50));

insert into Dimcustomer(customer, city)select 
distinct customer, city from rawsales;

#date
create table Dimdate(dateid int auto_increment primary key,
Saledate date,
month varchar(50),
Year int);

insert into Dimdate(Saledate, month, year)
select distinct Saledate,Date_format(Saledate, '%b'), year(saledate)
from rawsales;

#invoice facts
create table invoicefact
(InvoiceId int primary key,
dateid int,
customerid int, productid int, 
quantity int, Amount DECIMAL(12,2),
foreign key(dateid) references Dimdate(dateid),
foreign key(customerid) references Dimcustomer(customerid),
foreign key(productid) references Dimproduct(productid));

insert into Invoicefact
(InvoiceId, dateid, customerid,productid, quantity, amount)
select distinct r.invoiceid, d.dateid, c.customerid, p.productid, r.quantity, r.amount from rawsales r
join dimdate d
on r.saledate = d.saledate
join dimcustomer c on
r.customer = c.customer
join dimproduct p on r.product = p.product 
