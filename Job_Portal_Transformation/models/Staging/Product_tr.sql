WITH Product_Clean as (

    SELECT *
    FROM {{ source('Portal', 'PRODUCT') }}

)




SELECT DISTINCT *  
FROM Product_Clean 
WHERE PRODUCT_ID IS NOT NULL