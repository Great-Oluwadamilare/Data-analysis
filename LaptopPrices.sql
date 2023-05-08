--Checking the dataset to work with 
SELECT *
FROM 
laptopPrice

---Touchscreen Laptops Price 
SELECT TOP 10 brand,ssd, os, ram_gb, Touchscreen, Price 
FROM 
laptopPrice
WHERE Touchscreen = 'Yes' 
Group By  brand,ssd, os, ram_gb, Touchscreen, Price
ORDER BY MAX(price) DESC


--Price of Mac Laptops 
SELECT TOP 10 brand,ram_gb, ssd, os, os_bit, price 
FROM laptopPrice
WHERE OS = 'MAC'
ORDER BY price DESC

--Price of Windows Laptops 
SELECT TOP 10 brand,ram_gb, ssd, os, os_bit, price 
FROM laptopPrice
WHERE OS = 'Windows'
ORDER BY price DESC

--Price of DOS Operating Laptops 
SELECT TOP 10 brand,ram_gb, ssd, os, os_bit, price 
FROM laptopPrice
WHERE OS = 'DOS'
ORDER BY price DESC