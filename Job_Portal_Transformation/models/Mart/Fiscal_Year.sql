WITH Year_cal AS (
    SELECT 
        CUSTOMER_ID,
        PAY_DATE,
        MIN(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID) AS FIRST_BUY,
        MAX(PAY_DATE) OVER (PARTITION BY CUSTOMER_ID) AS LAST_BUY
    FROM {{ ref('Transactions_tr') }}
)


SELECT 
    t.PAY_DATE,
    MONTH(t.PAY_DATE) as MONTHS,
    COUNT(DISTINCT CASE WHEN c.FIRST_BUY= t.PAY_DATE THEN c.customer_id END) AS NEW_LOGOS
    FROM {{ ref('Transactions_tr') }} as t
JOIN 
Year_cal as c 
ON t.CUSTOMER_ID= c.CUSTOMER_ID
GROUP BY t.PAY_DATE
ORDER BY t.PAY_DATE