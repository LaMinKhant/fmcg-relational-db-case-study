SELECT * FROM [dbo].[Products]
SELECT * FROM [dbo].[Customer]
SELECT * FROM [dbo].[Regions] Order by RegionsID
SELECT * FROM [dbo].[Sales]
SELECT * FROM [dbo].[Branches]
SELECT * FROM  [dbo].[SalesDetails]

INSERT INTO [dbo].[Products] (ProductName, ProductCategory, Unit, Price)
VALUES 
('Milk', 'Beverages', 'Bottle', 2500),
('Coffee', 'Beverages', 'Packet', 5000),
('Tea', 'Beverages', 'Packet', 3500),
('Biscuits', 'Food', 'Pack', 1200),
('Sugar', 'Food', 'kg', 2200),
('Cooking Oil', 'Food', 'Bottle', 6500),
('Toothpaste', 'Comsumer Goods', 'Tube', 2800),
('Detergent', 'Comsumer Goods', 'Bag', 4000),
('Bread', 'Food', 'Unit', 1500),
('Butter', 'Food', 'Box', 4500),
('Chilli Sauce', 'Food', 'Bottle', 1800),
('Sampoo Refill', 'Comsumer Goods', 'Packet', 1500),
('Notebook', 'Stationery', 'Unit', 2000),
('Pen', 'Stationery', 'Unit', 500),
('Tissue', 'Comsumer Goods', 'Pack', 1000);


INSERT INTO [dbo].[Customer] (CustomerName, phone, Address, email, CustomerType)
VALUES 
('Hla Hla', '09778899001', 'Bahan, Yangon', 'hlahla@gmail.com', 'Member'),
('Aye Aye', '09223344556', 'Kyauktada, Yangon', 'ayeaye@gmail.com', 'New'),
('Ko Ko', '09445566778', 'Chanmyathazi, Mandalay', 'koko@gmail.com', 'Member'),
('Zaw Zaw', '09889900112', 'Nay Pyi Taw', 'zawzaw@gmail.com', 'Member'),
('Mya Mya', '09112233445', 'Pathein, Ayeyarwady', 'myamya@gmail.com', 'New'),
('Nyi Nyi', '09667788990', 'Mawlamyine, Mon', 'nyinyi@gmail.com', 'Member'),
('Win Win', '09556677889', 'Taunggyi, Shan', 'winwin@gmail.com', 'Member'),
('Thida', '09334455667', 'Sittwe, Rakhine', 'thida@gmail.com', 'New'),
('Zaw Min', '09443322110', 'Magway', 'zawmin@gmail.com', 'Member');



INSERT INTO [dbo].[Regions] (RegionsName)
VALUES 
('KACHIN STATE'), ('KAYAH STATE'), ('KAYIN STATE'), ('CHIN STATE'), 
('SAGAING REGION'), ('TANINTHARYI REGION'), ('BAGO REGION'), ('MAGWAY REGION'), 
('MANDALAY REGION'), ('MON STATE'), ('RAKHINE STATE'), ('YANGON REGION'), 
('SHAN STATE'), ('AYEYARWADY REGION'), ('NAY PYI TAW');


INSERT INTO [dbo].[Sales] (SalesDate, CustomerID, BranchesID, TotalAmount, PaymentMethod)
VALUES
('2026/01/01', 1, 1, 5000, 'Cash'),
('2026/01/02', 1, 2, 12000, 'WAVEPAY'),
('2026/01/03', 3, 3, 45000, 'AYAPAY'),
('2026/02/04', 3, 3, 2000, 'KPAY'),
('2026/02/05', 5, 5, 8000, 'Cash'),
('2026/03/06', 6, 1, 15000, 'WAVEPAY'),
('2026/04/07', 7, 1, 25000, 'AYAPAY'),
('2026/04/08', 8, 2, 3000, 'Cash'),
('2026/05/09', 9, 3, 7000, 'KPAY'),
('2026/05/10', 9, 3, 50000, 'WAVEPAY'),
('2026/05/10',1, 3, 50000, 'WAVEPAY'),
('2026/05/11',2, 11, 1200, 'Cash'),
('2026/05/12',2, 11, 9000, 'AYAPAY'),
('2026/05/13',3, 13, 4000, 'KPAY'),
('2026/05/14',5, 15, 20000, 'Cash'),
('2026/05/15',6, 15, 6000, 'WAVEPAY')


INSERT INTO [dbo].[SalesDetails] (SalesID, ProductID, Qty, Discount, Price, Total)
VALUES 
(1, 1, 2, 0, 20000, 40000),
(2, 2, 1, 0.05, 9000, 8550),
(3, 3, 5, 0, 3000, 15000),
(4, 4, 3, 0.02, 1500, 4410),
(5, 5, 2, 0, 1800, 3600),
(6, 6, 10, 0, 1000, 10000),
(7, 7, 1, 0, 500000, 500000),
(8, 8, 1, 0, 1100000, 1100000),
(9, 9, 4, 0.01, 2500, 9900),
(10, 10, 2, 0, 5000, 10000),
(11, 11, 1, 0, 3500, 3500),
(12, 12, 3, 0, 1200, 3600),
(13, 13, 2, 0.05, 2200, 4180),
(14, 14, 1, 0, 6500, 6500),
(15, 15, 5, 0, 2800, 14000)

INSERT INTO [dbo].[Branches] (BranchesName, RegionsID)
VALUES 
('ABC', 1), ('City Express', 1), ('G&G', 2), ('ABC', 3), ('City Express', 4),
('G&G', 5), ('ABC', 6), ('City Express', 7), ('G&G', 8), ('ABC', 9),
('City Express', 10), ('G&G', 11), ('ABC', 12), ('City Express', 13), ('G&G', 14);

