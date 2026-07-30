# Customer Churn Analysis using PostgreSQL & Tableau

## Project Overview

This project analyzes customer churn behavior for a telecom company using PostgreSQL and Tableau. The objective is to identify the key factors contributing to customer churn, quantify business impact, and provide actionable recommendations to improve customer retention.

The analysis covers customer demographics, contract types, payment methods, internet services, revenue metrics, and a custom rule-based customer risk segmentation model.

---

## Tech Stack

- PostgreSQL
- SQL
- Tableau Public
- Excel

---

## Dataset

**IBM Telco Customer Churn Dataset**

- Total Customers: **7,043**
- Features: **21**
- Domain: Telecom
- Target Variable: Customer Churn

---

## Project Structure

```
customer-churn-analysis/
│
├── data/
│   └── customer_churn_clean.csv
│
├── sql/
│   ├── schema.sql
│   ├── import.sql
│   └── analysis.sql
│
├── dashboard/
│   ├── Dashboard Tableau.png
│   └── Dashboard.twb
│
├── insights.md
│
└── README.md
```

---

## Database Design

A PostgreSQL database was created to store the telecom customer dataset.

The project includes:

- Database Schema Creation
- CSV Import
- Data Cleaning
- SQL-based Business Analysis

---

## SQL Analysis Performed

- Customer Count
- Churn Rate Analysis
- Revenue Analysis
- Revenue Lost due to Churn
- Contract-wise Churn Analysis
- Payment Method Analysis
- Internet Service Analysis
- Customer Segmentation
- Gender-wise Churn
- Senior Citizen Analysis
- Monthly Charges Analysis
- Tenure Analysis
- Custom Customer Risk Segmentation

---

## Tableau Dashboard

The dashboard includes:

### KPI Cards

- Total Customers
- Churn Rate
- Total Revenue
- Revenue Lost

### Visualizations

- Churn by Contract
- Churn by Payment Method
- Churn by Internet Service
- Customer Risk Distribution
- Top High-Risk Customers

---

## Custom Business Feature

Unlike a standard churn dashboard, this project introduces a **Rule-Based Customer Risk Scoring Model**.

Customers are categorized into:

- Critical
- High
- Medium
- Low

The risk score considers:

- Contract Type
- Customer Tenure
- Online Security
- Technical Support
- Monthly Charges

This enables businesses to prioritize retention efforts even before customers churn.

---

## Key Business Insights

- Month-to-month contracts exhibit the highest customer churn.
- Customers using Electronic Check have the highest churn rate.
- Fiber Optic users churn more frequently than DSL users.
- Customers with shorter tenure are more likely to churn.
- Lack of Technical Support and Online Security strongly correlates with higher churn.
- Significant revenue is lost due to customer churn.
- High-risk customers can be identified using business rules for proactive retention campaigns.

---

## Business Recommendations

- Encourage customers to switch to long-term contracts.
- Provide retention offers for high-risk customers.
- Improve customer support quality.
- Promote online security and technical support services.
- Design loyalty programs targeting low-tenure customers.
- Monitor customers with high monthly charges and month-to-month contracts.

---

## Dashboard Preview

![dashboard](<dashboard/Dahsboard Tableau.png>)

```
dashboard/Customer_Churn_Dashboard.png
```

---

## Skills Demonstrated

- SQL
- PostgreSQL
- Data Cleaning
- Exploratory Data Analysis
- Business Intelligence
- Tableau Dashboard Development
- KPI Design
- Customer Segmentation
- Business Analytics
- Data Visualization

---

## Author

**Shaurya Pratap Singh**

B.Tech Artificial Intelligence & Machine Learning

Data Analytics | SQL | Tableau | Python | Excel
