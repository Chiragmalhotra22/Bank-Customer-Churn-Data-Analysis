# Bank Customer Churn Data Analysis

## Overview

This project analyzes bank customer churn data to gain insights into customer behavior and predict churn. The dataset includes information such as customer demographics, transaction history, and churn status.

## Table of Contents

- [Dataset Overview](#dataset-overview)
- [Setup](#setup)
- [Prerequisites](#Prerequisites)
- [Installation](#Installation)
- [Queries](#Queries)
- [Insights](#Insights)
- [Getting Started](#GettingStarted)

## Dataset Overview

The churn prediction dataset, which contains raw data of 28,382 customers.
The dataset contains the following columns:

- `customer_id`: Unique identifier for each customer
- `vintage`: Customer relationship tenure in days
- `age`: Customer age
- `gender`: Customer gender
- `dependents`: Number of dependents
- `occupation`: Customer occupation
- `city`: Customer city
- `customer_nw_category`: Customer net worth
- `branch_code`: Bank branch code
- `current_balance`: Current account balance
- `previous_month_end_balance`: Account balance at the end of the previous month
- `average_monthly_balance_prevQ`: Average monthly balance of the previous quarter
- `average_monthly_balance_prevQ2`: Average monthly balance of the quarter before the previous quarter
- `current_month_credit`: Total credit amount in the current month
- `previous_month_credit`: Total credit amount in the previous month
- `current_month_debit`: Total debit amount in the current month
- `previous_month_debit`: Total debit amount in the previous month
- `current_month_balance`: Account balance at the end of the current month
- `previous_month_balance`: Account balance at the end of the previous month
- `churn`: Binary variable indicating customer churn (1 for churn, 0 for non-churn)
- `last_transaction`: Date of the last transaction

  This dataset provides a comprehensive view of various attributes related to the customers' banking activities. With these features, it becomes possible to build predictive models to identify potential churners based on historical and current customer behavior. The dataset's size allows for robust analysis and modeling to improve customer retention strategies.

## Setup
To set up the project, follow these steps:

## Prerequisites
- MySQL installed on your local machine.
- The 'churn_prediction.csv' dataset available.
  
## Installation
- Create a new MySQL database.
- Import the dataset into the database using provided SQL scripts.
  
## Queries
This project includes a collection of Analysis to extract useful information from the dataset.

SQL queries link :- https://github.com/MeetP1703/Gun_violence_data/blob/main/gun_violence_data.sql

##Insights

Key insights derived from the analysis, including trends, patterns, and correlations in Bank customer churn data.

1. Segmenting customers based on age
2. Branch with highest average current balance
3. Age distribution of churned customers
4. Average time between transaction for each customer
5. cumulative sum of previous months credits
6. average dependents for churned customers by occupation
7. Churn percentage over time
8. No of churned customers by branch code
9. Average monthly credit for non churned customers
10. Customers with no recent transaction and high churn probability
11. Customer with highest total credit transactions
12. Customer with highest total debit in last quarter
13. Customers with consistent high average monthly balance
14. average monthly debt to credit ratio
15. Total credits and debits for each customer

## Getting Started

- Clone the repository.
- Follow the setup instructions to create and populate the MySQL database.
- Dive into the queries to extract valuable information.
- Explore the insights section for key findings.
