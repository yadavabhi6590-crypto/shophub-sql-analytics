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

[ERD Diagram](Diagram.png)
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
![Q12(
)

## Project Structure
- `report/` : full project report (PDF)
- `schema/` : ERD and table creation scripts
- `sql_scripts/` : all SQL queries
- `screenshots/` : query outputs

## Author
Yadav Abhishek | [LinkedIn](https://www.linkedin.com/in/abhishek-yadav-465960310/)
