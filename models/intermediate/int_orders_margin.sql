SELECT
  s.orders_id
  ,MAX(s.date_date) AS date_date
  ,ROUND(SUM(s.revenue),2) AS revenue
  ,ROUND(SUM(s.quantity),2) AS quantity
  ,ROUND(SUM(s.quantity*p.purchase_price),2) AS purchase_cost
  ,ROUND(SUM(s.revenue-(s.quantity*p.purchase_price)),2) AS margin
FROM {{ref('stg_raw__sales')}} AS s
LEFT JOIN{{ref('stg_raw__product')}} AS p
ON s.products_id=p.products_id
GROUP BY s.orders_id
ORDER BY s.orders_id DESC