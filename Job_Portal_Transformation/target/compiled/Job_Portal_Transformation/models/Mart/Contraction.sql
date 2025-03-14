with contraction_1 as (
    select 
        PAY_DATE,
        sum(REVENUE*QUANTITY) as revenue_per_month,
        lag(revenue_per_month) over (order by PAY_DATE) as Revenue_previous
    from JOB_PORTAL_TRANFORMATION_DB.JOB_TRANSFORMED_SCHEMA.Transactions_tr
    group by PAY_DATE
),
contraction_2 as (
    select PAY_DATE, revenue_per_month, coalesce(Revenue_previous, 0) Revenue_previous from contraction_1
),

contraction_3 as (
    select 
        PAY_DATE, 
        revenue_per_month, 
        Revenue_previous,
        (revenue_per_month - Revenue_previous) as contraction
    from contraction_2
    where Revenue_previous > revenue_per_month
)
select * from contraction_3