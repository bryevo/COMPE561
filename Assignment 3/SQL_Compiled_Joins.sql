/*Chapter 4 Problem 1 */
SELECT CategoryName, ProductName, ListPrice
FROM Products JOIN Categories
ON Products.CategoryID = Categories.CategoryID
ORDER BY CategoryName, ProductName ASC;

/*Chapter 4 Problem 2 */
SELECT FirstName, LastName, Line1, City, State, Zipcode
FROM Addresses JOIN Customers
ON Addresses.CustomerID = Customers.CustomerID
WHERE EmailAddress = 'allan.sherwood@yahoo.com';

/*Chapter 4 Problem 3 */
SELECT FirstName, LastName, Line1, City, State, Zipcode
FROM Addresses JOIN Customers
ON Addresses.CustomerID = Customers.CustomerID
WHERE AddressID = ShippingAddressID;

/*Chapter 4 Problem 4 */
SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
FROM Customers AS Cust
	JOIN Orders AS Ord ON Cust.CustomerID = Ord.CustomerID
	JOIN OrderItems AS OrdItm ON Ord.OrderID = OrdItm.OrderID
	JOIN Products AS Prod ON OrdItm.ProductID = Prod.ProductID
ORDER BY LastName, OrderDate, ProductName;

/*Chapter 4 Problem 5 */
SELECT Suh.ProductName, Suh.ListPrice
FROM Products AS Suh JOIN Products AS Dude
ON  Suh.ListPrice = Dude.ListPrice AND
	Suh.ProductID <> Dude.ProductID
ORDER BY ProductName;

/*Chapter 4 Problem 6 */
SELECT CategoryName, ProductID
FROM Categories LEFT JOIN Products
ON Categories.CategoryID = Products.CategoryID
AND ProductID IS NULL;

/*Chapter 4 Problem 7 */
SELECT 'SHIPPED' AS ShipStatus, OrderID, OrderDate 
FROM Orders
WHERE ShipDate IS NOT NULL
UNION 
SELECT 'NOT SHIPPED' AS ShipStatus, OrderID, OrderDate
FROM Orders
WHERE ShipDate IS NULL
ORDER BY OrderDate;