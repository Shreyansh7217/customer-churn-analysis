SELECT COUNT(*) AS total_customers
FROM customer_churn;
SELECT *
FROM customer_churn
LIMIT 10;
SELECT COUNT(*) AS missing_totalcharges
FROM customer_churn
WHERE totalcharges = '';

SELECT customerid,
       COUNT(*)
FROM customer_churn
GROUP BY customerid
HAVING COUNT(*) > 1;

SELECT DISTINCT churn
FROM customer_churn;

SELECT column_name,
       data_type
FROM information_schema.columns
WHERE table_name = 'customer_churn';

UPDATE customer_churn
SET totalcharges = NULL
WHERE TRIM(totalcharges) = '';

ALTER TABLE customer_churn
ALTER COLUMN totalcharges
TYPE NUMERIC(10,2)
USING totalcharges::NUMERIC;

SELECT column_name,
       data_type
FROM information_schema.columns
WHERE table_name = 'customer_churn'
AND column_name = 'totalcharges';


--Section 1: Overview KPIs
SELECT COUNT(*) AS total_customers
FROM customer_churn;

select count(*) as churned_customers from customer_churn
where churn = 'Yes';

select count(*) as active_customers from customer_churn
where churn = 'No';

select round(100 * sum(case when churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customer_churn;

SELECT
ROUND(SUM(totalcharges),2) AS total_revenue
FROM customer_churn;

select round(avg(monthlycharges),2) as average_monthly_charges
from customer_churn;

SELECT
ROUND(AVG(tenure),2) AS avg_tenure
FROM customer_churn;

--Section 2: Customer Demographics
SELECT
    gender,
    COUNT(*) AS customer_count,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM customer_churn),
        2
    ) AS percentage_of_total,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn
GROUP BY gender
ORDER BY percentage_of_total DESC;

SELECT
seniorcitizen,
COUNT(*) AS customers,
ROUND(
100.0*
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) AS churn_rate
FROM customer_churn
GROUP BY seniorcitizen;

SELECT
partner,
COUNT(*) customers,
ROUND(
100.0*
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate
FROM customer_churn
GROUP BY partner;

--Section 3: Contract Analysis
SELECT
contract,
COUNT(*) customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
100.0*
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate DESC;

SELECT
contract,
ROUND(SUM(totalcharges),2) revenue
FROM customer_churn
GROUP BY contract
ORDER BY revenue DESC;

--Results: Customers on month-to-month contracts show the highest churn rate, indicating that long-term contracts improve customer retention. The company could reduce churn by encouraging month-to-month customers to switch to one-year or two-year plans through targeted discounts or loyalty benefits.

--Section 4: Service Analysis
SELECT
internetservice,
COUNT(*) AS customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(
100.0*SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) AS churn_rate
FROM customer_churn
GROUP BY internetservice
ORDER BY churn_rate DESC;

SELECT
paymentmethod,
COUNT(*) customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
100.0*SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate
FROM customer_churn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

SELECT
paymentmethod,
COUNT(*) customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,
ROUND(
100.0*SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate
FROM customer_churn
GROUP BY paymentmethod
ORDER BY churn_rate DESC;

SELECT
techsupport,
COUNT(*) customers,
ROUND(
100.0*SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate
FROM customer_churn
GROUP BY techsupport;

--Section 5: Revenue Analysis
SELECT
ROUND(SUM(totalcharges),2) AS revenue_lost
FROM customer_churn
WHERE churn='Yes';

SELECT
contract,
ROUND(SUM(monthlycharges),2) monthly_revenue
FROM customer_churn
GROUP BY contract
ORDER BY monthly_revenue DESC;

--Advanced Feature #1 — Customer Risk Score
SELECT
customerid,

CASE

WHEN contract='Month-to-month'
AND tenure<12
AND techsupport='No'
AND onlinesecurity='No'
THEN 'Very High Risk'

WHEN contract='Month-to-month'
AND tenure<24
THEN 'High Risk'

WHEN tenure<36
THEN 'Medium Risk'

ELSE 'Low Risk'

END AS churn_risk

FROM customer_churn;

--Advanced Feature #2 — Retention Recommendation Engine
SELECT
customerid,

CASE

WHEN contract='Month-to-month'
THEN 'Offer Annual Discount'

WHEN techsupport='No'
THEN 'Bundle Tech Support'

WHEN tenure<6
THEN 'Onboarding Campaign'

WHEN monthlycharges>80
THEN 'Offer Loyalty Discount'

ELSE 'No Action'

END AS retention_strategy

FROM customer_churn;

--Advanced Feature #3 — Executive Summary Table
SELECT

COUNT(*) total_customers,

SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) churned,

ROUND(
100.0*
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)
/COUNT(*),2
) churn_rate,

ROUND(AVG(monthlycharges),2) avg_monthly_charge,

ROUND(AVG(tenure),2) avg_tenure,

ROUND(SUM(totalcharges),2) revenue

FROM customer_churn;
