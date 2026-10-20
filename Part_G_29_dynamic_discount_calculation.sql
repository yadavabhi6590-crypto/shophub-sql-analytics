 
-- Create a stored procedure for dynamic discount calculation.
use shophub_db
delimiter //
drop procedure if exists calculatedynamicDiscount //
drop procedure if exists calculaterDynamiciDiscount //
CREATE PROCEDURE CalculateDynamicDiscount(
	in p_customer_unique_id varchar(50),
	out p_discount_percentage decimal (5,2)
)
BEGIN 
	Declare v_total_spend decimal(10,2);
    
    select coalesce(sum(oi.price),0)
    into v_total_spend
    from customer c
    join orders o on c.customer_id =o.customer_id
    join order_items oi on o.order_id = oi.order_id
    where c.customer_unique_id =p_customer_unique_id 
    and o.order_status ='delivered';
    
    IF v_total_spend >= 1000.00 then
    set p_discount_percentage =15.00;
    elseif v_total_spend >= 500.00 then
    set p_discount_percentage =10.00;
    elseif v_total_spend >= 100.00 then
    set p_discount_percentage = 5.00;
    else 
    set p_discount_percentage =0.00;
    end if;
    
    end //
    delimiter ;
    
    
CALL CalculateDynamicDiscount('0000366f3b9a7992bf8c76cfdf3221e2', @discount);
SELECT @discount AS assigned_discount_percentage;
    