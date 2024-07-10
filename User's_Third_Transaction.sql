with cte AS (
SELECT  user_id, spend, transaction_date, 
        dense_rank() OVER(PARTITION BY user_id ORDER BY transaction_date)
FROM transactions)
SELECT user_id, spend, transaction_date
FROM cte
WHERE dense_rank = 3
