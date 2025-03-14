
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.chk
         as
        (WITH

Customer_cte AS(

    SELECT

        *

    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_PORTAL_TRANFORMATION_SCHEMA.CUSTOMERS

)

SELECT * FROM Customer_cte
        );
      
  