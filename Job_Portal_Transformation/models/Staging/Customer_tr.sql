WITH Customer_Clean as (

    SELECT 
    CUSTOMER_ID,
    COMPANY,
    {{remove_special_characters('CUSTOMERNAME') }} AS CUSTOMER_NAME

    FROM {{ source('Portal', 'CUSTOMERS') }}

)




SELECT DISTINCT * 
FROM Customer_Clean 
WHERE COMPANY IS NOT NULL