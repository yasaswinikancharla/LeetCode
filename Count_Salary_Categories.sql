'''
Table: Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.
 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.
'''
--Query
/* Write your T-SQL query statement below */
with cte as (
Select
    CASE WHEN income<20000 THEN 'Low Salary'
    when income>=20000 and income<=50000 THEN 'Average Salary'
    when income>50000 THen 'High Salary'
    else '0'
    end as category,count(account_id) as accounts_count
    from Accounts
    GRoup by CASE WHEN income < 20000 THEN 'Low Salary'
     WHEN income >= 20000 and income <= 50000 THEN 'Average Salary'
     WHEN income > 50000 THEN 'High Salary' 
     else '0' END
),
AllCategories as
(SELECT 'Low Salary' AS Category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)
Select c.Category,
Case
    when s.accounts_count is null then 0
    else s.accounts_count
end as accounts_count
From AllCategories c
left join cte s on c.Category= s.Category
