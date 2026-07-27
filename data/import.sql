\copy customer_churn
FROM 'customer_churn_clean.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE
);