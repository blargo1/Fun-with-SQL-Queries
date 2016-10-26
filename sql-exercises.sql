/*Return all category names with their descriptions from the Categories table.*/
	select * FROM [NORTHWND].[dbo].[Categories]

/*Return the contact name, customer id, and company name of all Customers in London*/
	select ContactName, CustomerID, CompanyName, City FROM [NORTHWND].[dbo].[Customers] WHERE City='London'

/*Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number*/
	select * FROM [NORTHWND].[dbo].[Suppliers] WHERE Fax IS NOT NULL

/*Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.*/
	select CustomerID, RequiredDate, Freight FROM [NORTHWND].[dbo].[Orders] WHERE RequiredDate BETWEEN '1997-01-01' AND '1998-01-01' AND Freight <=100

/*Return a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.*/
	select CompanyName, ContactName, ContactTitle, Country FROM [NORTHWND].[dbo].[Customers] WHERE Country IN ('Mexico', 'Sweden', 'Germany') AND ContactTitle='Owner'

/*Return a count of the number of discontinued products in the Products table.*/
	select COUNT(Discontinued) FROM [NORTHWND].[dbo].[Products] 

/*Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.*/
	select CategoryName, Description FROM [NORTHWND].[dbo].[Categories] WHERE CategoryName LIKE 'CO%'

/*Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.*/
	select CompanyName, Address, City, Country, PostalCode FROM [NORTHWND].[dbo].[Suppliers] WHERE Address LIKE '%rue%' ORDER BY CompanyName 

/*Return the product id and the total quantities ordered for each product id in the Order Details table.*/
	select ProductID, Quantity FROM [NORTHWND].[dbo].[Order Details]

/*Return the customer name and customer address of all customers with orders that shipped using Speedy Express.*/
	select ContactName, Address FROM Customers, Orders WHERE Orders.ShipVia = 1
	select * from Shippers 

/*Return a list of Suppliers containing company name, contact name, contact title and region description.*/
	select CompanyName, ContactName, ContactTitle, Region FROM [NORTHWND].[dbo].[Suppliers]

/*Return all product names from the Products table that are condiments.*/
	select * FROM [NORTHWND].[dbo].[Products] WHERE ProductName LIKE '%Louis%'

/*Return a list of customer names who have no orders in the Orders table.*/
	select CustomerID, ShipName, ShippedDate FROM [NORTHWND].[dbo].[Orders] Details WHERE ShippedDate IS NULL
	
/*Add a shipper named 'Amazon' to the Shippers table using SQL.*/
	INSERT INTO [NORTHWND].[dbo].[Shippers] (CompanyName, Phone) VALUES ('Amazon', '(503) 555-9932')

/*Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.*/
	UPDATE [NORTHWND].[dbo].[Shippers] SET CompanyName='Amazon Prime Shipping' WHERE ShipperID = 4 

/*Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.*/
	select [Shippers].[CompanyName], format(round(sum(Orders.Freight), 0), 'C') AS [FreightTotals] FROM [Orders]
	LEFT JOIN [Shippers] 
	ON [Orders].[ShipVia] = [Shippers].[ShipperID]
	group by [CompanyName]

/*Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.*/
	select [LastName]+ ',' +[FirstName] AS DisplayName FROM [NORTHWND].[dbo].[Employees]	

/*Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.*/
	INSERT INTO Customers (CustomerID, CompanyName, ContactName) VALUES ('BLARG', 'Largos Cargo', 'Ben Largo')
	select CustomerID, CompanyName, ContactName FROM Customers 
	INSERT INTO Orders (CustomerID, ShipName) VALUES ('BLARG', 'Grandma/s Boysenberry Spread')
	select CustomerID, ShipName FROM Orders

/*Remove yourself and your order from the database.*/
	DELETE FROM Customers WHERE CustomerID='BLARG'
	DELETE FROM Orders WHERE CustomerID='BLARG'
	select CustomerID, CompanyName, ContactName FROM Customers
	select CustomerID, ShipName FROM Orders

/*Return a list of products from the Products table along with the total units in stock for each product. Include only products with TotalUnits greater than 100.*/
	select ProductName, UnitsInStock from Products WHERE UnitsInStock >=100
