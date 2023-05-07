--checking the table to work with

SELECT *
FROM
supermarket_sales

--Performance by branch
SELECT branch, SUM(total) TotalSalesByBranches
FROM
supermarket_sales
GROUP BY branch
ORDER BY TotalSalesByBranches DESC

--Sales Record By Customer 

SELECT customer_type, SUM(total) TotalPurchaseByCustomer
FROM
supermarket_sales
GROUP BY customer_type
ORDER BY TotalPurchaseByCustomer DESC

--Top Selling Product Line

SELECT DISTINCT Product_line, Count(product_line) OVER (PARTITION BY product_line) TopSellingProductLine
FROM
supermarket_sales
ORDER BY TopSellingProductLine DESC

--Total Average 
SELECT AVG(total)AverageSalesForTheYear
FROM
supermarket_sales

--Total Item Sold in a Year
SELECT SUM(quantity)TotalQuantitySalesForTheYear
FROM
supermarket_sales

