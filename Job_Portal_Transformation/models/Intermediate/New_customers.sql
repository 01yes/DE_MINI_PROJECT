WITH New_Customers as
(
    SELECT 
    DATE_TRUNC('month', PAY_DATE) AS month,
    COUNT(DISTINCT  CUSTOMER_ID) AS new_customers
FROM 
    {{ ref('Transactions_tr') }}
GROUP BY 
    DATE_TRUNC('month', PAY_DATE)
ORDER BY 
    month
)

SELECT * FROM New_Customers

