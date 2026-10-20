

with recursive category_hierarchy as (
	select distinct 
		substring_index(product_category_name_english,'-',1) as category_name,
        null as parent_category,
        CAST(Substring_index(product_category_name_english,'-',1) as char(500)) as category_path, 1 as depth
        from product_category_name_
        where product_category_name_english is not null
        
        union all 
        
        select 
			t.product_category_name_english as category_name,
            ch.category_name as parent_category,
            concat(ch.category_path, '>' , t.product_category_name_english) as category_path,
            ch.depth + 1 as depth
            from product_category_name_ t
            join category_hierarchy ch
            
				on substring_index(t.product_category_name_english, '-',1) = ch.category_name
                where ch.depth =1
                and t.product_category_name_english != ch.category_name
                and t.product_category_name_english like concat(ch.category_name,'_%')
			)
            select 
            category_name,
            parent_category,
            category_path,
            depth
            from category_hierarchy
            order by category_path;

