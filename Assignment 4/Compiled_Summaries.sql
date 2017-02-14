/*Name: Brian Vo	RedID: 816906487*/

/*Chapter 5 Question 1*/
SELECT COUNT(*) AS NumberOfOrders, 
	   SUM(TaxAmount) AS TotalTaxAmount
FROM Orders;

/*Chapter 5 Question 2*/
SELECT Cat.CategoryName, 
	   COUNT(Prod.CategoryID) AS NumberOfProducts, 
	   MAX(Prod.ListPrice) AS MostExpensiveProduct
FROM Categories Cat JOIN Products Prod ON Cat.CategoryID = Prod.CategoryID
GROUP BY Cat.CategoryName
ORDER BY COUNT(*) DESC;

/*Chapter 5 Question 3*/
SELECT Cust.EmailAddress,
	   SUM(OrdItm.ItemPrice * OrdItm.Quantity) AS TotalItemPrice,
	   SUM(OrdItm.DiscountAmount * OrdItm.Quantity) AS TotalDiscountAmount
/*FROM Customers Cust JOIN Orders Ord ON Cust.CustomerID = Ord.CustomerID
	 JOIN OrderItems OrdItm ON Ord.OrderID = OrdItm.OrderID */
FROM Customers Cust, Orders Ord, OrderItems OrdItm
WHERE Cust.CustomerID = Ord.CustomerID
AND Ord.OrderID = OrdItm.OrderID
GROUP BY EmailAddress
ORDER BY TotalItemPrice DESC;

/*Chapter 5 Question 4*/
SELECT Cust.EmailAddress,
	   COUNT(*) AS NumberOfOrders,
	   SUM((OrdItm.ItemPrice - OrdItm.DiscountAmount) * OrdItm.Quantity) AS TotalItemAmount
FROM Customers Cust, Orders Ord, OrderItems OrdItm
WHERE Cust.CustomerID = Ord.CustomerID
AND Ord.OrderID = OrdItm.OrderID
GROUP BY EmailAddress
HAVING COUNT(*) > 1
ORDER BY TotalItemAmount DESC;

/*Chapter 5 Question 5*/
SELECT Cust.EmailAddress,
	   COUNT(*) AS NumberOfOrders,
	   SUM((OrdItm.ItemPrice - OrdItm.DiscountAmount) * OrdItm.Quantity) AS TotalItemAmount
FROM Customers Cust, Orders Ord, OrderItems OrdItm
WHERE Cust.CustomerID = Ord.CustomerID
AND Ord.OrderID = OrdItm.OrderID
AND OrdItm.ItemPrice > 400
GROUP BY EmailAddress
HAVING COUNT(*) > 1
ORDER BY TotalItemAmount DESC;

/*Chapter 5 Question 6*/
SELECT Prod.ProductName,
	   SUM(OrdItm.ItemPrice - OrdItm.DiscountAmount) AS TotalAmount
FROM Products Prod, OrderItems OrdItm
WHERE Prod.ProductID = OrdItm.ProductID
GROUP BY ProductName WITH ROLLUP;

/*Chapter 5 Question 7*/
SELECT Cust.EmailAddress,
	   COUNT(DISTINCT Prod.ProductID) AS DistinctProducts
FROM Customers Cust JOIN Orders Ord ON Cust.CustomerID = Ord.CustomerID
	 JOIN OrderItems OrderItm ON Ord.OrderID = OrderItm.OrderID
	 JOIN Products Prod ON OrderItm.ProductID = Prod.ProductID
GROUP BY EmailAddress
HAVING COUNT(DISTINCT Prod.ProductID) > 1;




