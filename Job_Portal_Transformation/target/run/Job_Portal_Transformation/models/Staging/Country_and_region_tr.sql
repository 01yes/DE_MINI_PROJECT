
  
    

        create or replace transient table JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Country_and_region_tr
         as
        (WITH COUNTRY_Clean as (

    SELECT *
    FROM JOB_PORTAL_TRANFORMATION_DB.JOB_PORTAL_TRANFORMATION_SCHEMA.COUNTRY_AND_REGION

)




SELECT DISTINCT * 
FROM COUNTRY_Clean 
WHERE CUSTOMER_ID IS NOT NULL
        );
      
  