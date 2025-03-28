
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Churn_Cal
         as
        (WITH Ch AS(
 
    SELECT
    CUSTOMER_ID,
    PAY_DATE

    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr

)





SELECT DISTINCT
    CUSTOMER_ID,
    FIRST_VALUE(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID ORDER BY PAY_DATE) AS FirstOrderDate,
    LAST_VALUE(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID ORDER BY PAY_DATE) AS LastOrderDate

FROM
      Ch
        );
      
  