SELECT
  s.orders_id
  ,s.date_date AS date_date
  ,s.products_id AS nb_products
  ,s.revenue AS revenue
  ,s.quantity AS quantity
  ,p.purchase_price AS purchase_price
  ,ROUND(s.quantity*p.purchase_price,2) AS purchase_cost
  ,ROUND(s.revenue-(s.quantity*p.purchase_price),2) AS margin
FROM {{ref('stg_raw__sales')}} AS s
LEFT JOIN{{ref('stg_raw__product')}} AS p
ON s.products_id=p.products_id