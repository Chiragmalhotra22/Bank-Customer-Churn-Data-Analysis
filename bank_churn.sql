-- 1 Segmenting customers based on age
SELECT
  CASE
    WHEN age < 30 THEN 'Young'
    WHEN age > 30 AND age < 60 THEN 'Middle-Aged'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS customer_count
FROM mytable
GROUP BY age_group

-- 2 Branch with highest average current balance
SELECT branch_code, AVG(current_balance) AS avg_balance
FROM mytable
GROUP BY branch_code
ORDER BY avg_balance DESC
LIMIT 1;

-- 3 Calculate age distribution of churned customers
SELECT age, COUNT(*) AS age_count
FROM mytable
WHERE churn = 1
GROUP BY age
ORDER BY age_count DESC;

-- 4 Calculate average time between transactions for each customer
select customer_id, AVG(days_between_transactions) AS avg_days_between_transactions
FROM (
SELECT
customer_id,
DATEDIFF(last_transaction,LAG(last_transaction) OVER (PARTITION BY customer_id ORDER BY last_transaction)) AS days_between_transactions
FROM mytable
) AS subquery
GROUP BY customer_id

-- 5 cumulative sum of previous months credits
SELECT
    customer_id,
    customer_nw_category,
    previous_month_credit,
    SUM(previous_month_credit) OVER (PARTITION BY customer_nw_category ORDER BY customer_id) AS cumulative_credit
FROM
    mytable;

-- 6 average dependents for churned customers by occupation
SELECT
    occupation,
    AVG(dependents) AS avg_dependents_churned
FROM mytable
WHERE churn = 1
GROUP BY occupation;

-- 7 churn percentage over time
SELECT
    DATE_FORMAT(last_transaction, '%Y-%m') AS month,
    AVG(churn) * 100 AS churn_percentage
FROM
    mytable
GROUP BY
    month
ORDER BY
    month;

-- 8 no of churned customers by branch code
SELECT
    branch_code,
    COUNT(*) AS churned_customer_count
FROM
    mytable
WHERE
    churn = 1
GROUP BY
    branch_code;

-- 9 average monthly credit for non churned customers
SELECT
    AVG(current_month_credit) AS avg_monthly_credit_non_churned
FROM
    mytable
WHERE
    churn = 0
    order by 
	avg_monthly_credit_non_churned;
    
-- 10 Customers with No Recent Transactions and High Churn Probability
SELECT DISTINCT
    customer_id
FROM
    mytable
WHERE
    last_transaction < DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)
    AND churn > 0.8; 
    
-- 11  Customers with the Highest Total Credit Transactions
SELECT
    customer_id,
    SUM(current_month_credit) AS total_credit
FROM
    mytable
GROUP BY
    customer_id
ORDER BY
    total_credit DESC
LIMIT 5;

-- 12 Customers with the Highest Total Debits in the Last Quarter
SELECT
    customer_id,
    SUM(current_month_debit) AS total_debit_last_quarter
FROM
    mytable
WHERE
    last_transaction >= DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH)
GROUP BY
    customer_id
ORDER BY
    total_debit_last_quarter DESC
LIMIT 5;

-- 13 Customers with Consistently High Average Monthly Balances
SELECT DISTINCT
    t1.customer_id
FROM
    mytable t1
WHERE
    NOT EXISTS (
        SELECT 1
        FROM
            mytable t2
        WHERE
            t2.customer_id = t1.customer_id
            AND t2.average_monthly_balance_prevQ < 10000
            AND t2.average_monthly_balance_prevQ2 < 10000
    );

-- 14 Average Monthly Debit-to-Credit Ratio by Occupation
SELECT
    occupation,
    AVG(current_month_debit / NULLIF(current_month_credit, 0)) AS avg_debit_credit_ratio
FROM
    mytable
GROUP BY
    occupation;

-- 15 Total Credits and Debits for Each Customer
SELECT
    customer_id,
    SUM(current_month_credit) AS total_credits,
    SUM(current_month_debit) AS total_debits
FROM mytable
GROUP BY customer_id;
