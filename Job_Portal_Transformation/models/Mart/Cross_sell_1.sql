WITH CustomerProducts AS (
    SELECT
        CUSTOMER_ID,
        
        PRODUCT_ID
    FROM
        {{ ref('Transactions_tr') }}
    GROUP BY
        CUSTOMER_ID,
        PRODUCT_ID
),




SELECT *
FROM
    CustomerProducts
