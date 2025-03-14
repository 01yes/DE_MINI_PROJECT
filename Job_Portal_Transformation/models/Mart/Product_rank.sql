With Transaction_data as (
    SELECT
    PRODUCT_ID ,
    revenue,
    revenue_type,
    payment_month,
    SUM(revenue)OVER(PARTITION BY PRODUCT_ID ) AS TOTAL_REVENUE

    FROM {{ ref('Transactions_tr') }}
   

),

Product_data as(
    SELECT
    PRODUCT_ID ,
    product_family,
    product_sub_family

    FROM {{ ref('Product_tr') }}
   

)


SELECT DISTINCT 
    dense_rank() OVER(PARTITION BY Tr.PRODUCT_ID ORDER BY REVENUE DESC) AS Rank,
    Tr.PRODUCT_ID ,
    Pr.product_family,
    Pr.product_sub_family,
    Tr.TOTAL_REVENUE,
     
    Tr.revenue_type,
    Tr.payment_month
    
    
    
FROM Transaction_data as Tr
LEFT JOIN Product_data as Pr
ON Tr.PRODUCT_ID  = Pr.PRODUCT_ID 