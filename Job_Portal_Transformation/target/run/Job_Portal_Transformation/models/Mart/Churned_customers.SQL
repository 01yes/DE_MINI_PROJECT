
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Churned_customers
         as
        (WITH Churned_customers as
(
    SELECT 
        DATE_TRUNC('month', PAY_DATE) AS month,
            COUNT(DISTINCT  CUSTOMER_ID) AS churned_customers
    FROM 
        JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.New_customers
    WHERE 
        status = 'churned'
    GROUP BY 
        DATE_TRUNC('month', PAY_DATE)
    ORDER BY 
        month
)
SELECT *
    FROM
    Churned_customers
        );
      
  