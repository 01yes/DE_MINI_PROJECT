WITH ProductPairs AS 
(
    SELECT
        cp1.PRODUCT_ID AS product_id_1,
        cp2.PRODUCT_ID AS product_id_2,
        COUNT(*) AS frequency
    FROM
        JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Cross_sell_1
    JOIN
        CustomerProducts cp2
    ON
        cp1.CUSTOMER_ID = cp2.CUSTOMER_ID
        AND cp1.PRODUCT_ID < cp2.PRODUCT_ID
    GROUP BY
        cp1.PRODUCT_ID,
        cp2.PRODUCT_ID
)


select * from ProductPairs