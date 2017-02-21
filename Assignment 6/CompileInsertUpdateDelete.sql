/*Brian Vo		RedID: 816906487 */
/*Chapter 7 Problem 1*/
INSERT INTO Categories(CategoryName) values('WoodWinds');

/*Chapter 7 Problem 2*/
UPDATE Categories SET CategoryName = 'Woodwinds' WHERE CategoryID=5;

/*Chapter 7 Problem 3*/
DELETE FROM Categories WHERE CategoryID=5;


/*Chapter 7 Problem 4*/
INSERT INTO Products(CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded) 
VALUES(4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, CURRENT_TIMESTAMP);

/*Chapter 7 Problem 5*/
UPDATE Products SET DiscountPercent=35 WHERE ProductCode='dgx_640';

/*Chapter 7 Problem 6*/
DELETE FROM Products WHERE CategoryID=4;
DELETE FROM Categories WHERE CategoryID=4;

/*Chapter 7 Problem 7*/
INSERT INTO Customers(EmailAddress, Password, FirstName, LastName) 
VALUES('rick@raven.com', '', 'Rick', 'Raven');

/*Chapter 7 Problem 8*/
UPDATE Customers SET Password='secret' WHERE EmailAddress='rick@raven.com';

/*Chapter 7 Problem 9*/
UPDATE Customers SET Password='reset';

