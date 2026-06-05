-- Joins & Unions 
--• Retrieve every Sales ID alongside its explicit matching Branch Name. 
SELECT S.SalesID, S.CustomerID,S.TotalAmount, S.PAymentMethod, B.BranchesName
FROM [dbo].[Sales] AS S
JOIN [dbo].[Branches] AS B
ON S.BranchesID = B.BranchesID

--• Display all products and any corresponding sales detail transaction records if they occurred. 
SELECT SD.SalesDetailsID,SD.SalesID, SD.Qty,P.Unit, SD.Discount, SD.Price, SD.Total, P.ProductName
FROM [dbo].[SalesDetails] AS SD
JOIN [dbo].[Products] AS P
ON SD.ProductID = P.ProductID


--• Extract an overview linking Invoice details with Branch names and geographical Region names.
SELECT S.SalesID, S.SalesDate, S.CustomerID, B.BranchesName, R.RegionsName, S.TotalAmount, S.PaymentMethod
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Branches] AS B
ON S.BranchesID = B.BranchesID
INNER JOIN [dbo].[Regions] AS R
ON B.RegionsID = R.RegionsID

SELECT * FROM [dbo].[Sales];
SELECT * FROM [dbo].[Branches];
SELECT * FROM [dbo].[Regions];
--• Combine all unique regional names from the Region system and product categories into a single distinct flat vertical string list.
SELECT RegionsName AS Combined 
FROM [dbo].[Regions]
UNION
SELECT ProductCategory AS Combined
FROM [dbo].[Products];

--• Combine regional records with product category values while preserving duplicate records. 
SELECT RegionsName AS Combined 
FROM [dbo].[Regions]
UNION ALL
SELECT ProductCategory AS Combined
FROM [dbo].[Products];

--• Show all sales records including transaction parameters and matching customer descriptive metrics. 

SELECT S.SalesID, S.SalesDate, S.TotalAmount, S.PaymentMethod, C.CustomerName, C.CustomerType
FROM [dbo].[Sales] AS S
INNER JOIN [dbo].[Customer] AS C 
ON S.CustomerID = C.CustomerID;

--• List every customer record alongside explicit transaction details using an outer structure. 
SELECT S.SalesID, S.SalesDate, S.TotalAmount, S.PaymentMethod, C.CustomerName, C.CustomerType
FROM [dbo].[Customer] AS C
LEFT JOIN [dbo].[Sales] AS S
ON S.CustomerID = C.CustomerID;

--• Generate a matrix detailing line total values alongside the respective product item name.
SELECT P.ProductName, SUM(SD.Qty * SD.Price) AS "Line Total Value"
FROM [dbo].[SalesDetails] AS SD
INNER JOIN [dbo].[Products] AS P 
ON SD.ProductID = P.ProductID
GROUP BY P.ProductName;


--• Display structural combinations of all branches paired against all products to check potential distribution paths.
WITH BranchProductSales AS (
    SELECT S.BranchesID,SD.ProductID,SUM(SD.Qty * SD.Price) AS TotalValue
    FROM [dbo].[SalesDetails] AS SD
    JOIN [dbo].[Sales] AS S 
	ON SD.SalesID = S.SalesID
    GROUP BY S.BranchesID, SD.ProductID
)
SELECT 
    B.BranchesName,
    P.ProductName,
    BPS.TotalValue
FROM BranchProductSales AS BPS
JOIN [dbo].[Branches] AS B ON BPS.BranchesID = B.BranchesID
JOIN [dbo].[Products] AS P ON BPS.ProductID = P.ProductID;


