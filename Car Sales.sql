--Checking the data to work with 

SELECT *
FROM car_sales_data

---Total qty of Cars Sold in a year
--2022
SELECT COUNT(car_make) TotalQuantityOfCarSold, car_make, car_model
FROM car_sales_data
WHERE salesdate BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY car_make, car_model
ORDER BY TotalQuantityOfCarSold DESC


--2023

SELECT COUNT(car_make) TotalQuantityOfCarSold, car_make, car_model
FROM car_sales_data
WHERE salesdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY car_make, car_model
ORDER BY TotalQuantityOfCarSold DESC

--Best Sale Person in a year
--2022
SELECT TOP 10 salesperson, COUNT(car_make) TotalCarSoldBySalesPerson, SUM(sale_price) TOtalSalesBySalesPerson
FROM car_sales_data
--WHERE salesdate BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY salesperson
ORDER BY TotalCarSoldBySalesPerson DESC


--2023
SELECT TOP 10 salesperson, COUNT(car_make) TotalCarSoldBySalesPerson, SUM(sale_price) TOtalSalesBySalesPerson
FROM car_sales_data
WHERE salesdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY salesperson
ORDER BY TotalCarSoldBySalesPerson DESC


--Total Sales in a year
--2022
SELECT SUM(sale_price) TOtalAnnualSales
FROM car_sales_data
WHERE salesdate BETWEEN '2022-01-01' AND '2022-12-31'


--2023
SELECT SUM(sale_price) TOtalAnnualSales
FROM car_sales_data
WHERE salesdate BETWEEN '2023-01-01' AND '2023-12-31'



---loyalty customer 

SELECT TOP 10 customer_name, COUNT(customer_name) TotalNumberOfPatronage, car_make
FROM car_sales_data
GROUP BY customer_name, car_make
ORDER BY TotalNumberOfPatronage DESC


---Top selling car model in a year
SELECT car_model, COUNT(car_model) TotalModelSold, sale_price
FROM car_sales_data
GROUP BY car_model, sale_price
ORDER BY TotalModelSold DESC

--Total Commission Earned By Sale Person
--2022
SELECT TOP 10 salesperson, SUM(commission_earned) TotalCommissionEarnedBySalesPerson
FROM car_sales_data
WHERE salesdate BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY salesperson
ORDER BY TotalCommissionEarnedBySalesPerson DESC

--2023
SELECT TOP 10 salesperson, SUM(commission_earned) TotalCommissionEarnedBySalesPerson
FROM car_sales_data
WHERE salesdate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY salesperson
ORDER BY TotalCommissionEarnedBySalesPerson DESC



