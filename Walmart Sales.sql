create database Walmart;

select * from walmart_sales;

# store metrics
select COUNT(DISTINCT Store) from walmart_sales;

# Total number of holiday weeks
SELECT 
    COUNT(DISTINCT Date) AS Total_Holiday_Weeks
FROM walmart_sales
WHERE Holiday_Flag = 1;

# Total number of non-holiday weeks
SELECT 
    COUNT(DISTINCT Date) AS Total_Non_Holiday_Weeks
FROM walmart_sales
WHERE Holiday_Flag = 0;

# calculating the total weekly sales for each store
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales
FROM walmart_sales
GROUP BY Store;

# Calculating the average weekly sales for each store
SELECT Store, AVG(Weekly_Sales) AS Average_Weekly_Sales
FROM walmart_sales
GROUP BY Store;

# Calculating the total weekly sales during the holiday weeks
SELECT SUM(Weekly_Sales) AS Total_Weekly_Sales_On_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 1;

# Calculating the total weekly sales during non-holiday weeks
SELECT SUM(Weekly_Sales) AS Total_Weekly_Sales_On_Non_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 0;

# Average weekly sales by store during holiday weeks
SELECT 
    Store,
    AVG(Weekly_Sales) AS Average_Weekly_Sales_On_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 1
GROUP BY Store;

# Average weekly sales by store during non-holiday weeks
SELECT 
    Store,
    AVG(Weekly_Sales) AS Average_Weekly_Sales_On_Non_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 0
GROUP BY Store;

# Total weekly sales during holiday weeks for a specific store
SELECT 
    Store,
    SUM(Weekly_Sales) AS Total_Weekly_Sales_On_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 1
GROUP BY Store;

# Total weekly sales during non-holiday weeks for a specific store
SELECT 
    Store,
    SUM(Weekly_Sales) AS Total_Weekly_Sales_On_Non_Holidays
FROM walmart_sales
WHERE Holiday_Flag = 0
GROUP BY Store;

# Percentage of weekly sales during holiday weeks compared to total sales
SELECT 
    SUM(CASE WHEN Holiday_Flag = 1 THEN Weekly_Sales ELSE 0 END) / SUM(Weekly_Sales) AS Holiday_Sales_Percentage
FROM walmart_sales;

# Calculating the average temperature for each store
SELECT Store, AVG(Temperature) AS Average_Temperature
FROM walmart_sales
GROUP BY Store;

# Calculating the average fuel price for each store
SELECT Store, AVG(Fuel_Price) AS Average_Fuel_Price
FROM walmart_sales
GROUP BY Store;

# Calculating the average CPI for each store
SELECT Store, AVG(CPI) AS Average_CPI
FROM walmart_sales
GROUP BY Store;

# Calculating the average unemployment rate for each store
SELECT Store, AVG(Unemployment) AS Average_Unemployment
FROM walmart_sales
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with high temperatures(above 30 degrees)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_High_Temperature
FROM walmart_sales
WHERE Temperature > 30
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with low temperatures(below 30 degrees)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_Low_Temperature
FROM walmart_sales
WHERE Temperature < 30
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with high fuel prices(above $3.52)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_High_Fuel_Price
FROM walmart_sales
WHERE Fuel_Price > 3.52
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with low fuel prices(below $3.52)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_Low_Fuel_Price
FROM walmart_sales
WHERE Fuel_Price < 3.52
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with high CPI(above 150)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_High_CPI
FROM walmart_sales
WHERE CPI > 150
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with low CPI(below 150)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_Low_CPI
FROM walmart_sales
WHERE CPI < 150
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with high unemployment rates (above 6%)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_High_Unemployment
FROM walmart_sales
WHERE Unemployment > 6
GROUP BY Store;

# Calculating the total weekly sales for each store during weeks with low unemployment rates (below 6%)
SELECT Store, SUM(Weekly_Sales) AS Total_Weekly_Sales_Low_Unemployment
FROM walmart_sales
WHERE Unemployment < 6
GROUP BY Store;

# Calculating the correlation coefficient between Weekly_Sales and Temperature
SELECT 
    (COUNT(*) * SUM(Weekly_Sales * Temperature) - SUM(Weekly_Sales) * SUM(Temperature)) / 
    (SQRT((COUNT(*) * SUM(Weekly_Sales * Weekly_Sales) - SUM(Weekly_Sales) * SUM(Weekly_Sales)) * 
    (COUNT(*) * SUM(Temperature * Temperature) - SUM(Temperature) * SUM(Temperature)))) AS Correlation_Temperature_WeeklySales
FROM walmart_sales;
 
# Calculating the correlation coefficient between Weekly_Sales and Fuel_Price
SELECT 
    (COUNT(*) * SUM(Weekly_Sales * Fuel_Price) - SUM(Weekly_Sales) * SUM(Fuel_Price)) / 
    (SQRT((COUNT(*) * SUM(Weekly_Sales * Weekly_Sales) - SUM(Weekly_Sales) * SUM(Weekly_Sales)) * 
    (COUNT(*) * SUM(Fuel_Price * Fuel_Price) - SUM(Fuel_Price) * SUM(Fuel_Price)))) AS Correlation_FuelPrice_WeeklySales
FROM walmart_sales;

# Calculating the correlation coefficient between Weekly_Sales and CPI
SELECT 
    (COUNT(*) * SUM(Weekly_Sales * CPI) - SUM(Weekly_Sales) * SUM(CPI)) / 
    (SQRT((COUNT(*) * SUM(Weekly_Sales * Weekly_Sales) - SUM(Weekly_Sales) * SUM(Weekly_Sales)) * 
    (COUNT(*) * SUM(CPI * CPI) - SUM(CPI) * SUM(CPI)))) AS Correlation_CPI_WeeklySales
FROM walmart_sales;

# Calculating the Correlation coefficient between Weekly_Sales and Unemployment
SELECT 
    (COUNT(*) * SUM(Weekly_Sales * Unemployment) - SUM(Weekly_Sales) * SUM(Unemployment)) / 
    (SQRT((COUNT(*) * SUM(Weekly_Sales * Weekly_Sales) - SUM(Weekly_Sales) * SUM(Weekly_Sales)) * 
    (COUNT(*) * SUM(Unemployment * Unemployment) - SUM(Unemployment) * SUM(Unemployment)))) AS Correlation_Unemployment_WeeklySales
FROM walmart_sales;

