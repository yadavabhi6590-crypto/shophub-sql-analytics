# ShopHub SQL Analytics Project

SQL project on the Olist Brazilian E-Commerce dataset using MySQL.
Covers database design, data cleaning, joins, CTEs, window functions,
stored procedures and index optimization.

## Dataset
[Olist Brazilian E-Commerce Dataset (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## Tech Stack
- MySQL 8.0
- MySQL Workbench

## Database Design
3NF schema with 8 tables: customer, orders, order_items, products,
sellers, order_payments, order_reviews, geolocation.

![ERD](<img width="1200" height="870" alt="Part_A_Q_3" src="https://github.com/user-attachments/assets/499992fe-a32c-4427-8ab3-79d373fc9778" />
)

## Topics Covered
| Part | Topic |
|---|---|
| A | Database design and data quality checks |
| B | Transactions (COMMIT / ROLLBACK), orphan records, fraud detection |
| C | Aggregations: MoM growth, CLV, ROLLUP, seasonality |
| D | Joins: customer 360 view, market basket analysis |
| E | Subqueries, CTEs, recursive CTEs |
| F | Window functions: moving average, LAG, RANK |
| G | Stored procedures and index optimization |

## Sample Output

### Q12: Top 10 products by revenue per category
![Q12](<img width="1488" height="857" alt="Part_c_12" src="https://github.com/user-attachments/assets/ef77f0a3-0677-40e5-913d-977d7d5368c3" />
)

## Project Structure
- `report/` : full project report (PDF)
- `schema/` : ERD and table creation scripts
- `sql_scripts/` : all SQL queries
- `screenshots/` : query outputs

## Author
Yadav Abhishek | [LinkedIn](https://www.linkedin.com/in/abhishek-yadav-465960310/)
