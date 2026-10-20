-- Rank sellers by revenue within each state.

with  seller_revenue as (
select s.seller_id, 
		s.seller_state,
        round(sum(oi.price),2) as total_revenue
        from sellers s
        join order_items oi
        on s.seller_id =oi.seller_id
        group by s.seller_id , s.seller_State
),
Ranked_Sellers as (
select 
seller_id ,
seller_state,
total_revenue,
rank() over(partition by seller_state
	order by total_revenue desc
    ) as  revenue_rank
    from seller_revenue
)
select seller_state,
seller_id,
total_revenue,
revenue_rank
from ranked_sellers
where revenue_rank <= 10
order by seller_state asc , revenue_rank asc;