
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Customer_tr
         as
        (WITH Customer_Clean as (

    SELECT 
    CUSTOMER_ID,
    COMPANY,
    
    regexp_replace(CUSTOMERNAME, '[^a-zA-Z0-9]', '')
 AS CUSTOMER_NAME

    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_PORTAL_TRANFORMATION_SCHEMA.CUSTOMERS

)




SELECT DISTINCT * 
FROM Customer_Clean 
WHERE COMPANY IS NOT NULL
        );
      
  