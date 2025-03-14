
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Customer_rank
         as
        (With Transaction_data as (
    SELECT
    PRODUCT_ID ,
    revenue,
    revenue_type,
    PAY_DATE

    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr
   

),

Product_data as(
    SELECT
    PRODUCT_ID ,
    product_family,
    product_sub_family

    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Product_tr
   

)

SELECT DISTINCT 
    Tr.PRODUCT_ID ,
    Tr.revenue,
    Tr.revenue_type,
    Tr.PAY_DATE,
    Pr.product_family,
    Pr.product_sub_family,
     dense_rank() OVER(PARTITION BY Tr.PRODUCT_ID ORDER BY REVENUE DESC) AS Rank
FROM Transaction_data as Tr
LEFT JOIN Product_data as Pr
ON Tr.PRODUCT_ID  = Pr.PRODUCT_ID
        );
      
  