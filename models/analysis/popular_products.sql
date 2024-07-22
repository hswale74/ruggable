Select
p.brand,
p.thickness,
v.shape,
v.size_grp,
round(avg(case when v.popular_variant_flag then 1 else 0 end)*100,2) as pct_variants_popular,
count(1) as count_variants
from {{ref('parent_product')}} p
join {{ref('parent_variant_map')}} v
on p.parent_product_id = v.parent_product_id
group by 1,2,3,4
having count(1) > 50
order by 5 desc