CREATE DATABASE [Kultra Mega Stores Inventory]

USE [Kultra Mega Stores Inventory]
GO

SELECT [Row_ID]
      ,[Order_ID]
      ,[Order_Date]
      ,[Order_Priority]
      ,[Order_Quantity]
      ,[Sales]
      ,[Discount]
      ,[Ship_Mode]
      ,[Profit]
      ,[Unit_Price]
      ,[Shipping_Cost]
      ,[Customer_Name]
      ,[Province]
      ,[Region]
      ,[Customer_Segment]
      ,[Product_Category]
      ,[Product_Sub_Category]
      ,[Product_Name]
      ,[Product_Container]
      ,[Product_Base_Margin]
      ,[Ship_Date]
  FROM [dbo].[KMS_Sales]

GO

--1. Which product category had the highest sales?
SELECT TOP 1 Product_Category, SUM(Sales) AS Highest_Sales
FROM KMS_Sales
GROUP BY Product_Category
ORDER BY Highest_Sales DESC



--2. What are the Top 3 and Bottom 3 regions in terms of sales?

SELECT TOP 3 Region, SUM(Sales) AS Highest_Sales
FROM KMS_Sales
GROUP BY Region
ORDER BY Highest_Sales DESC


SELECT TOP 3 Region, SUM(Sales) AS Highest_Sales
FROM KMS_Sales
GROUP BY Region
ORDER BY Highest_Sales ASC

--3. What were the total sales of appliances in Ontario?
SELECT SUM(Sales) AS Total_Appliance_Sales
FROM KMS_Sales
WHERE Region = 'Ontario'
AND Product_Sub_Category = 'Appliances';

--4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers
SELECT TOP 10 Customer_Name,Region , SUM(Profit) AS Revenue
FROM KMS_Sales
GROUP BY Customer_Name, Region
ORDER BY Revenue ASC

--5. KMS incurred the most shipping cost using which shipping method?
SELECT TOP 1 Ship_Mode, SUM(Shipping_Cost) AS Highest_Shipping_Cost
FROM KMS_Sales
GROUP BY Ship_Mode
ORDER BY Highest_Shipping_Cost DESC

--6. Who are the most valuable customers, and what products or services do they typically purchase?
SELECT TOP 10 Customer_Name,Product_Sub_Category, SUM(Profit) AS Highest_Revenue
FROM KMS_Sales
GROUP BY Customer_Name,Product_Sub_Category
ORDER BY Highest_Revenue DESC

--7. Which small business customer had the highest sales?

SELECT TOP 1 Customer_Name, Customer_Segment, SUM(Sales) AS Highest_Sales
FROM KMS_Sales
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name,Customer_Segment
ORDER BY Highest_Sales DESC

--8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1 Customer_Name, Customer_Segment, COUNT(Order_Quantity) AS Total_Orders
FROM KMS_Sales
WHERE Customer_Segment = 'Corporate'
AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name, Customer_Segment
ORDER BY Total_Orders DESC

--9. Which consumer customer was the most profitable one?

SELECT TOP 1 Customer_Name, Customer_Segment, SUM(Profit) AS Total_Profit
FROM KMS_Sales
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name,Customer_Segment
ORDER BY Total_Profit DESC

--10. Which customer returned items, and what segment do they belong to?
