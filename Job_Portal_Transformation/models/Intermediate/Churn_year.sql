WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(PAY_DATE) AS first_order_date,
        MAX(PAY_DATE) AS last_order_date
    FROM 
        {{ ref('Transactions_tr') }}
    GROUP BY
        CUSTOMER_ID
),


churned_customers AS (
    SELECT
        CUSTOMER_ID,
        first_order_date,
        last_order_date,
        CASE
            WHEN DATEDIFF(year,first_order_date,last_order_date) > 1 THEN 'Churned'
            ELSE 'Active'
        END AS churn_status
        

    FROM
        customer_orders
)


SELECT
    CUSTOMER_ID,
    first_order_date,
    last_order_date,
    churn_status
FROM
    churned_customers
