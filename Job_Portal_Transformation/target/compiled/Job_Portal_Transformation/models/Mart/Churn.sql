WITH Churn AS(
 
    SELECT
    PAY_DATE,
    COUNT(DISTINCT CUSTOMER_ID) AS Number_of_customers
    
    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr
    GROUP BY PAY_DATE
    ORDER BY PAY_DATE DESC

)



SELECT 
    PAY_DATE,
    
    lag(Number_of_customers,1,0) over (order by PAY_DATE) AS PREVIOUS_COUNT,
    Number_of_customeRS-PREVIOUS_COUNT
FROM 
    Churn