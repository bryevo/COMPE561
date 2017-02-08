/*Chapter 3 Problem 1 */
SELECT ProductCode, ProductName, ListPrice, DiscountPercent 
FROM Products 
ORDER BY ListPrice DESC;

/*Chapter 3 Problem 2 */
SELECT LastName + ', ' + FirstName AS FullName
FROM Customers
/*WHERE LastName BETWEEN 'M' AND 'Z' this Excludes Z last names*/
WHERE LastName >= 'M'
ORDER BY LastName ASC;

/*Chapter 3 Problem 3 */
SELECT ProductName, ListPrice, DateAdded
FROM Products
WHERE ListPrice BETWEEN 500 AND 2000
ORDER BY DateAdded DESC;

/*Chapter 3 Problem 4 */
SELECT ProductName, ListPrice, DiscountPercent, 
	ListPrice * (DiscountPercent/100) AS DiscountAmount,
	ListPrice - (ListPrice * (DiscountPercent/100)) AS DiscountPrice
FROM Products
ORDER BY DiscountPrice DESC;

/*Chapter 3 Problem 5 */
SELECT ItemID, ItemPrice, DiscountAmount, Quantity,
	(ItemPrice * Quantity) AS PriceTotal,
	(DiscountAmount * Quantity) AS DiscountTotal,
	((ItemPrice - DiscountAmount) * Quantity) AS ItemTotal
FROM OrderItems
WHERE ((ItemPrice - DiscountAmount) * Quantity) > 500
ORDER BY ItemTotal DESC;

/*Chapter 3 Problem 6 */
SELECT OrderID, OrderDate, ShipDate
FROM Orders
WHERE ShipDate IS NULL;

/*Chapter 3 Problem 7 */
SELECT 100 AS Price, 
	0.07 AS TaxRate, 
	100 * 0.07 AS TaxAmount, 
	100 + (100*0.07) AS Total;
