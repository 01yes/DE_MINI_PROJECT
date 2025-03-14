
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.churn_final
         as
        (WITH Customer_info AS (
    SELECT 
        CUSTOMER_ID,
        PAY_DATE,
        MIN(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID) AS FIRST_BUY,
        MAX(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID) AS LAST_BUY
    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr
)


SELECT 
    t.PAY_DATE,
    MONTH(t.PAY_DATE) as MONTHS,
    COUNT(DISTINCT CASE WHEN c.FIRST_BUY= t.PAY_DATE THEN c.customer_id END) AS NEW_CUSTOMERS,
    COUNT(DISTINCT CASE WHEN c.LAST_BUY = t.PAY_DATE THEN c.customer_id END) AS churned_customers
FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr as t
JOIN 
Customer_info as c 
ON t.CUSTOMER_ID= c.CUSTOMER_ID
GROUP BY t.PAY_DATE
ORDER BY t.PAY_DATE
        );
      
  