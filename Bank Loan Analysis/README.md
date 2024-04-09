# Bank Loan Analysis

## Overview

Ever thought of how bank manages its finance and which type of data it stores. In this project we will understand and analyze bank's data. We will focus on loan data, how much loan funded, interest rates, amount received, good loan, bad loan and many more.

## Problem Statements

1. What is the total loan application?
2. How much amount is funded this month and overall till now?
3. How much amount is received back this month and overall till now?
4. What is the average interest rate?
5. Do an analysis of good loan and bad loan?
6. What is average debt to income ratio?
7. Analysis based on other categories?

## Tools used
1. MS Excel - to store raw data
2. MS SQL server - to connect to database and store data in proper format
3. Power BI - for visualization and creating report

## Dashboard
### Created three Dashboard:
#### 1. Summary -> Analysis of good loan, bad loan and loan status.

![image](https://github.com/agr-saurabh/DataAnalyst/assets/125588378/a55a7402-331b-4434-bb36-2781311e7c2b)

#### 2. Overview -> Analysis by month, purpose, home ownership.

![image](https://github.com/agr-saurabh/DataAnalyst/assets/125588378/e2a3e12a-8585-4d6f-9332-43fc7ad615a3)

#### 3. Details -> Analysis of all details for some selected columns.

![image](https://github.com/agr-saurabh/DataAnalyst/assets/125588378/c911bfd2-e808-4fec-af8a-064def250833)


## Challenges and consideration
1. MS Excel -> Looking at 924415 (38765 x 24) data entries is never an easy task. Need to identify null values and any wrong data format.

2. MS SQL server -> Errors while importing data such as datatype was different and some numeric datatype was exceeding the limit. Make sure to properly align datatype and make id as primary key. Run all the queries and match output with the file provided.

3. Power BI -> The most easiest, enjoyable and toughest at the same time. Need to create a lot of new measures for MTD, PMTD, MoM, Total application, Total amount funded and received and many more. Also create a new table named as "Date Table" which has all dates from starting to end in the raw data to visualize category wise for each month.
