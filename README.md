# Product Performance Analysis in Big Basket Using MySQL

## Project Overview

This project involves analyzing product sales and customer preferences from Big Basket using advanced MySQL functionalities. It focuses on uncovering insights into category-wise performance, pricing strategies, and top-rated products through ranking, analytical queries, common table expressions (CTEs), views, stored procedures, and subqueries.

---

## Dataset Used

- **[Big Basket Product Dataset (Google Drive)](https://drive.google.com/file/d/17Uelhvii7VoJVuYAbvjsoBzwLdE5y5Sw/view?usp=drive_link)**

**Key Columns:**
- `id`: Product ID
- `product`: Product name
- `category`: Primary category
- `sub_category`: Subcategory classification
- `brand`: Product brand
- `sale_price`: Discounted sale price
- `market_price`: Original market price
- `type`: Product type
- `rating`: Customer rating

---

## Objectives

- Analyze and rank products by sale price within categories
- Create dynamic reports using CTEs and views
- Develop stored procedures for data manipulation and retrieval
- Identify top-rated products and category-level pricing insights
- Use conditional logic (CASE) for price-based discount categorization

---

## Tasks Completed

1. Ranked products based on their `sale_price` within each category
2. Compared each product’s `sale_price` with the next product in the same category using `LEAD()`
3. Created a CTE to extract the top 5 highest-rated products per category
4. Developed a view for quick access to products in the 'Beauty & Hygiene' category
5. Wrote a stored procedure to update the sale price of a product using its `id`
6. Used a CTE to calculate total sale price by category and applied ranking
7. Built a view to show price differences between `sale_price` and `market_price`
8. Created a stored procedure to return products from specific categories and subcategories
9. Used a subquery to find the highest-priced product in each category
10. Applied CASE statements to assign discount levels based on `market_price`

---

## Tools and Techniques

- MySQL (Window Functions: `RANK()`, `LEAD()`, etc.)
- Common Table Expressions (CTEs)
- Views
- Stored Procedures
- Subqueries
- CASE Logic

---
