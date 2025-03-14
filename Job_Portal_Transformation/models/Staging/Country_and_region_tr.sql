WITH COUNTRY_Clean as (

    SELECT *
    FROM {{ source('Portal', 'COUNTRY_AND_REGION') }}

)




SELECT DISTINCT * 
FROM COUNTRY_Clean 
WHERE CUSTOMER_ID IS NOT NULL