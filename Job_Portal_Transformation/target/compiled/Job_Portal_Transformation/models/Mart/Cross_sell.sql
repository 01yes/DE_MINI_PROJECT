WITH CustomerProducts AS (
    SELECT
        CUSTOMER_ID,
        
        PRODUCT_ID
    FROM
        JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr
    GROUP BY
        CUSTOMER_ID,
        PRODUCT_ID
),
ProductPairs AS (
    SELECT
        cp1.PRODUCT_ID AS product_id_1,
        cp2.PRODUCT_ID AS product_id_2,
        COUNT(*) AS frequency
    FROM
        CustomerProducts cp1
    JOIN
        CustomerProducts cp2
    ON
        cp1.CUSTOMER_ID = cp2.CUSTOMER_ID
        AND cp1.PRODUCT_ID < cp2.PRODUCT_ID
    GROUP BY
        cp1.PRODUCT_ID,
        cp2.PRODUCT_ID
)




SELECT *
FROM
    CustomerProducts