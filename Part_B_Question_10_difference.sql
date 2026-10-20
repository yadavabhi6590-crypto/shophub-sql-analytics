-- Detect potential fraud where payment value differs from order total.


select * from order_items

use tutedude_project



select * from order_items
select * from order_payments



select
	o.order_id,
round(sum(o.price + o.freight_value),2) as total_value,
p.payment_total,
round(p.payment_total -sum(o.price + o.freight_value),2) as diffrent_total
    from order_items o
    join (
		select order_id,
        round(sum(payment_value),2) as payment_total
        from order_payments
        group by order_id
        )p
        on o.order_id=p.order_id
        group by o.order_id, p.payment_total
        having total_value<> p.payment_total
        
