SELECT *, ROUND(((cys - pys)/ pys)*100,2)
FROM (
SELECT  EXTRACT(year FROM transaction_date) as year, product_id, SUM(spend) as cys,
        lag(SUM(spend),1,NULL) OVER(PARTITION BY product_id ORDER BY product_id,EXTRACT(year FROM transaction_date)) as pys
FROM user_transactions
GROUP BY EXTRACT(year FROM transaction_date), product_id
) s 
ORDER BY product_id,year
