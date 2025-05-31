select * from bigbasket_2;
-- 1. Rank products based on their sale price within each category.

select category, product, sale_price,
rank() over(partition by category order by sale_price desc) as Rank_SP,
dense_rank() over(partition by category order by sale_price desc) as Dense_Rank_SP
from bigbasket_2;


-- 2. Find the next product's sale price for comparison within the same category.

select category, product, sale_price,
lead(sale_price) over(partition by category order by sale_price desc) as Next_Product_SP,
lag(sale_price) over(partition by category order by sale_price desc) as Previous_Product_SP
from bigbasket_2;


-- 3. Create a CTE to get the top 5 highest-rated products for each category.

with Top_Rated as
(
select category, product, rating,
row_number() over(partition by category order by rating desc) as 
Row_num
from bigbasket_2
)
select * from Top_Rated where Row_num <= 5;


-- 4. Create a view to simplify querying for product information in the 'Beauty & Hygiene' category.

create view Beauty_Hygiene as
select id, product, category, sub_category, brand, rating
from bigbasket_2 where category = 'Beauty & Hygiene';
select * from Beauty_Hygiene;


-- 5. Write a stored procedure to update the sale price of a product by its id.

delimiter //
create procedure Update_Sale_P(in new_sale_price int, in r_id int)
begin
update bigbasket_2 set sale_price=new_sale_price where id=r_id;
end //
delimiter //
call Update_Sale_P(225, 3);

-- 6. Create a CTE to show the total sales price per category and rank them.

with Rank_Sp_category as
(
select category, sum(sale_price) as Total_SP
from bigbasket_2
group by category
)
select category, Total_SP,
dense_rank() over(order by Total_SP desc)
as Rnk
from Rank_Sp_Category;

-- 7. Create a view to store the sale price and market price difference for each product.

create view Difference as
select product, sale_price, market_price, (market_price-sale_price) as Diff 
from bigbasket_2;

select* from Difference;

-- 8. Create a stored procedure to return products from a specific category and sub category.

delimiter //
create procedure Return_Product (in s_cat char(100), in w_sub_cat char(100))
begin
select product from bigbasket_2 where category=s_cat and sub_category = w_sub_cat;
end //
delimiter ;
call Return_Product('Beverages','Tea');

-- 9. Use a subquery to find the product with the highest sale price in each category. 

select product, category, sale_price from 
(
select product, category, sale_price,
rank() over(partition by category order by sale_price desc) as Highest_SP
from bigbasket_2
)
ranked_products where Highest_SP = 1;

-- 10. Use CASE to assign discounts based on the market price of the products(>500 as high discount, from 200 to 500 as medium discount or else low discount).

select product, market_price,
case
when market_price > 500 then 'High Dis'
when market_price >200 then 'Medium Dis'
else 'Low Dis'
end as Discount_Lvl
from bigbasket_2;