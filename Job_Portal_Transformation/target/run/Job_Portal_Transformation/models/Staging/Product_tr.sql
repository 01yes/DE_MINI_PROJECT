
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Product_tr
         as
        (WITH Product_Clean as (

    SELECT *
    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_PORTAL_TRANFORMATION_SCHEMA.PRODUCT

)




SELECT * 
FROM Product_Clean 
WHERE PRODUCT_ID IS NOT NULL
        );
      
  