--SQL queries

--top-performing Product Category (TOP 5)

SELECT Product_Category,
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP
FROM Transaction_CustPro
GROUP BY Product_Category
ORDER BY Rev DESC;

--Top Spending Region

SELECT REGION,
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP
FROM Transaction_CustPro
GROUP BY REGION
ORDER BY Rev DESC;

--Top spending generation

SELECT GENERATION,
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP
FROM Transaction_CustPro
GROUP BY GENERATION
ORDER BY Rev DESC;

--Top spending gender

SELECT GENDER,
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP
FROM Transaction_CustPro
GROUP BY GENDER
ORDER BY Rev DESC;

--Top 20 Individual customers

SELECT card_no, 
        count(card_no) AS transactions_count,
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP,
        GENDER,
        Generation,
        REGION,
        PROVINCE
FROM Transaction_CustPro
GROUP BY card_no
HAVING COUNT(card_no) > 1
ORDER BY Rev DESC
LIMIT 20;

--Top 10 Provinces
SELECT PROVINCE,
        REGION,
        COUNT(PROVINCE),
        SUM(Sales) AS Rev,
        SUM(Gross_Margin) AS GM,
        SUM(Gross_Margin)/SUM(Sales) AS GP
FROM Transaction_CustPro
GROUP BY PROVINCE
ORDER BY Rev DESC
LIMIT 10;