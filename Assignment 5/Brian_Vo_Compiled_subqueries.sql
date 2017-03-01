/*Brian Vo		RedID: 816906487 */
/*Chapter 6 Problem 1*/
SELECT DISTINCT CategoryName 
FROM Categories Cat 
WHERE Cat.CategoryID IN (SELECT Prod.CategoryID FROM Products Prod)
ORDER BY CategoryName;

/*Chapter 6 Problem 2*/
SELECt ProductName, ListPrice 
FROM Products 
WHERE ListPrice > (SELECT AVG (Prod.ListPrice) FROM Products Prod) 
ORDER BY ListPrice DESC;

/*Chapter 6 Problem 3*/
SELECT Cat.CategoryName 
FROM Categories Cat 
WHERE NOT EXISTS (
	SELECT 1 
	FROM Products Prod 
	WHERE Prod.CategoryID = Cat.CategoryID);

/*Chapter 6 Problem 4*/
SELECT Cust.EmailAddress, MAX(OrderTotal) AS LargestOrder
FROM Customers Cust JOIN
	(SELECT Cust2.EmailAddress, Orders.OrderID, SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
	 FROM Customers Cust2
		JOIN Orders	ON Cust2.CustomerID = Orders.CustomerID
		JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
	 GROUP BY EmailAddress, Orders.OrderID) AS CustProd 
ON Cust.EmailAddress = CustProd.EmailAddress
GROUP BY Cust.EmailAddress;

/*Chapter 6 Problem 5*/
SELECT Prod.ProductName, Prod.DiscountPercent
FROM Products Prod
WHERE Prod.DiscountPercent NOT IN
    (SELECT Prod2.DiscountPercent
     FROM Products AS Prod2
     WHERE Prod.ProductName <> Prod2.ProductName)
ORDER BY ProductName;

/*Chapter 6 Problem 6*/
SELECT EmailAddress, OrderID, OrderDate
FROM Customers Cust JOIN Orders Ord ON Cust.CustomerID = Ord.CustomerID
WHERE OrderDate = (SELECT MIN(OrderDate) FROM Orders Ord2	--Min is earliest
	WHERE Cust.CustomerID = Ord2.CustomerID);
