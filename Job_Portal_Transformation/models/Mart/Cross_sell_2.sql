WITH ProductPairs AS 
(
    SELECT
        cp1.PRODUCT_ID AS product_id_1,
        cp2.PRODUCT_ID AS product_id_2,
        COUNT(*) AS frequency
    FROM
        {{ ref('Cross_sell_1') }}
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

SELECT
    p1.product_name AS Product_1,
    p2.product_name AS Product_2,
    pp.frequency
FROM
    ProductPairs pp
JOIN
    Products p1 ON pp.PRODUCT_ID = p1.PRODUCT_ID
JOIN
    Products p2 ON pp.PRODUCT_ID = p2.PRODUCT_ID
ORDER BY
    pp.frequency DESC