--Group By & Having 
--• Calculate total volumetric invoice transaction counts managed per distinct Branch. 
SELECT B.BranchesName, COUNT(S.SalesID) AS TotalInvoices
FROM [dbo].[Branches] B
JOIN Sales S ON B.BranchesID = S.BranchesID
GROUP BY B.BranchesName;

--• Display total items sold and financial revenue grouped by Product ID.
SELECT ProductID, SUM(Qty) AS TotalItemsSold, SUM(Total) AS TotalRevenue
FROM [dbo].[SalesDetails]
GROUP BY ProductID;

--• Find the average product unit price across individual inventory Categories. 
SELECT ProductCategory, AVG(Price) AS AveragePrice
FROM [dbo].[Products] 
GROUP BY ProductCategory

--• Calculate total processing volume counts per active Payment Method. 
SELECT PaymentMethod, SUM(SalesID)
FROM [dbo].[Sales]
GROUP BY PaymentMethod

--• Filter for product items whose total aggregated transactional revenue line scales higher than 5,000,000 MMK. 
SELECT ProductID, SUM(Total)  AS Total
FROM [dbo].[SalesDetails]
GROUP BY ProductID
HAVING SUM(Total)> 5000000

--• List customer types that generated more than 1,000 individual transactions.
SELECT C.CustomerType, COUNT(S.SalesID) AS Transactions
FROM [dbo].[Customer] C
JOIN [dbo].[Sales] S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerType
HAVING COUNT(S.SalesID) > 1000;

--• Find the maximum line total amount recorded per unique product, but only display maximum values that exceed 50,000 MMK. 
SELECT ProductID, MAX(Total) AS MaxlineTotal
FROM [dbo].[SalesDetails]
Group BY ProductID
HAVING MAX(Total)> 50000

--• Display the count of distinct customers handled per operational branch layout. 
SELECT B.BranchesName,COUNT(DISTINCT S.CustomerID) AS DistinctCustomer
FROM [dbo].[Sales] AS S
JOIN [dbo].[Branches] AS B
ON S.BranchesID = B.BranchesID
JOIN [dbo].[Customer] AS C
ON C.CustomerID = S.CustomerID
GROUP BY B.BranchesName

--• Extract total revenue numbers grouped by Branch Name and Category. 

SELECT B.BranchesName, P.ProductCategory, SUM(SD.Total) AS TotalRevenue
FROM [dbo].[Branches] AS B
JOIN [dbo].[Sales] AS S
ON B.BranchesID = S.BranchesID
JOIN [dbo].[SalesDetails] AS SD
ON SD.SalesID = S.SalesID
JOIN  [dbo].[Products] AS P
ON SD.ProductID = P.ProductID 
GROUP BY B.BranchesName, P.ProductCategory

--• Find categories that sold a combined total of more than 2,000 item units.
SELECT ProductCategory, SUM(Qty) AS Totalsold
FROM [dbo].[SalesDetails] AS SD
JOIN [dbo].[Products] AS P
ON SD.ProductID = P.ProductID
GROUP BY ProductCategory
HAVING SUM(Qty) > 2000