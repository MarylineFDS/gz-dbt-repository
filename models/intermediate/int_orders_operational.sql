SELECT
  o.orders_id AS orders_id
  ,MAX(o.date_date) AS date_date
  ,SUM(o.revenue) AS revenue
  ,SUM(o.quantity) AS quantity
  ,SUM(s.logcost) AS log_cost
  ,SUM(s.ship_cost) AS ship_cost
  ,SUM(s.shipping_fee) AS shipping_fee
  ,SUM(o.purchase_cost) AS purchase_cost
  ,SUM(o.margin) AS margin
  ,ROUND(SUM(o.margin+s.shipping_fee-s.logcost-s.ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS o
LEFT JOIN {{ ref('stg_raw__ship') }} AS s
ON o.orders_id=s.orders_id
GROUP BY o.orders_id
ORDER BY o.orders_id DESC