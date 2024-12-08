WITH ORDERS AS 
(
SELECT * FROM {{source('mymodel','FACT_ORDER_2023')}}
UNION ALL
SELECT * from {{source('mymodel','FACT_ORDERS_2024')}}
)
SELECT a.* FROM ORDERS a
LEFT JOIN {{source('mymodel','DIM_PRODUCT')}} b
ON a.PRODUCT_ID = b.PRODUCT_ID
LEFT JOIN   {{source('mymodel','CUST_PROD')}} C
ON b.PRODUCT_ID=c.PRODUCT_ID
LEFT JOIN {{source('mymodel','DIM_CUSTOMER')}} d
ON c.customer_id=d.customer_id