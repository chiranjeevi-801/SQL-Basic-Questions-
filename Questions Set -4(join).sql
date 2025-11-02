

select*from Customers

select * from Orders

select * from Products


-- 1) Identity pairs of coustomers who live in the same country 
select * from customers x join Customers y on x.Country =y.Country 

-- 2) find the customer who has the most on their orders 
select * from Customers c inner join Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID =p.ProductID


select CustomerName,sum(price) [amount spent] from Customers c inner join
Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID =p.ProductID
group by CustomerName


select CustomerName,sum(price) [amount spent],DENSE_RANK() over(order by sum(price) desc)[DR]
from Customers c inner join
Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID =p.ProductID
group by CustomerName -- adding DR column 

select customername from 
(select CustomerName,sum(price) [amount spent],DENSE_RANK() over(order by sum(price) desc)[DR]
from Customers c inner join
Orders o on c.CustomerID=o.CustomerID inner join Products p on o.ProductID =p.ProductID
group by CustomerName) m where DR=2 -- it is help to check top most spent amt 

-- 3) Find customers who have ordered more than one type of product 

select * from Customers c join Orders o on c.CustomerID=o.CustomerID

select CustomerName from Customers c join Orders o on c.CustomerID=o.CustomerID
group by CustomerName 
having count(productid)>1


--4) List all products and their corresponding orders,using a RIGHT JOIN,including products that been ordered .

select * from orders o right join products p on o. productID = p.ProductID 

select OrderID,p.ProductID,p.ProductName from orders o right join products p on o. productID = p.ProductID 



-- 5) Retrieve all orders placed by customers from the USA 
select OrderID from Customers c inner join orders o on c.CustomerID=o.customerID where country in ('USA')

--6) Find customers who have ordered a product priced above $500


select * from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.productID =o.ProductID
where Price > 500

select CustomerName from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join Products p on p.productID =o.ProductID
where Price > 500

--7) Find customers who have ordered the same product more than once
select * from customers c inner join orders o on c.CustomerID = o.CustomerID 

select CustomerName,productID,COUNT(orderID) from customers c inner join orders o on c.CustomerID = o.CustomerID 
group by CustomerName,ProductID

select CustomerName,productID,COUNT(orderID) from customers c inner join orders o on c.CustomerID = o.CustomerID 
group by CustomerName,ProductID
having COUNT(orderID)>1

select distinct m.CustomerName from
(select CustomerName,productID,COUNT(orderID) [Count] from customers c inner join orders o on c.CustomerID = o.CustomerID 
group by CustomerName,ProductID
having COUNT(orderID)>1) m