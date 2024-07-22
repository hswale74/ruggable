Select 
round(min_page_rank, -1) as page_rank_bucket,
avg(v.pct_variants_popular) as avg_pct_variants_popular
from {{ref('parent_product')}} p
join (Select parent_product_id,
        min(page_rank) as min_page_rank 
        from {{ref('link_product_map')}} group by 1) l
on l.parent_product_id = p.parent_product_id
join (
    Select parent_product_id, 
    avg(case when popular_variant_flag then 1 else 0 end) as pct_variants_popular,
    count(1) as count_variants
    from {{ref('parent_variant_map')}}
    group by 1) v
on p.parent_product_id = v.parent_product_id
group by 1
order by 1 