
CREATE DATABASE FMCG;

CREATE TABLE Regions(
	RegionsID INT IDENTITY(1,1) PRIMARY KEY, 
	RegionsName NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Branches( 
	BranchesID INT IDENTITY(1,1) PRIMARY KEY,
	BranchesName NVARCHAR(50) NOT NULL,
	RegionsID INT NOT NULL
	CONSTRAINT Regionfk FOREIGN KEY(RegionsID)
	REFERENCES Regions(RegionsID)
) 
CREATE TABLE Customer 
( 
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerName NVARCHAR(50),
	phone NVARCHAR(15),
	Address NVARCHAR(MAX),
	email NVARCHAR(30),
	CustomerType NVARCHAR(50)
	)
CREATE TABLE Products
(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(50) NOT NULL, 
	ProductCategory NVARCHAR(50) NOT NULL, 
	Unit VARCHAR(50) NOT NULL, 
	Price MONEY
)
CREATE TABLE Sales
(
	SalesID INT IDENTITY(1,1) PRIMARY KEY,
	SalesDate DATETIME,
	CustomerID INT NOT NULL,
	BranchesID INT NOT NULL,
	TotalAmount MONEY,
	PaymentMethod NVARCHAR(20),
	CONSTRAINT Customerfk FOREIGN KEY(CustomerID)
	REFERENCES Customer(CustomerID),
	CONSTRAINT Branchefk FOREIGN KEY(BranchesID)
	REFERENCES Branches(BranchesID)
)
CREATE TABLE SalesDetails
(
	SalesDetailsID INT IDENTITY(1,1) PRIMARY KEY,
	SalesID INT NOT NULL, --voucher code
	ProductID INT NOT NULL,
	Qty INT NOT NULL,
	Discount DECIMAL,
	Price MONEY,
	Total MONEY,
	CONSTRAINT Salesfk FOREIGN KEY(SalesID)
	REFERENCES Sales(SalesID),
	CONSTRAINT Productfk FOREIGN KEY(ProductID)
	REFERENCES Products(ProductID)
)
