
    
    

select
    link_product_map_uuid as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."link_product_map"
where link_product_map_uuid is not null
group by link_product_map_uuid
having count(*) > 1


