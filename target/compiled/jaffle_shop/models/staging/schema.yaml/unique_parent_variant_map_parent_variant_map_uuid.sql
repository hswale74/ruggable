
    
    

select
    parent_variant_map_uuid as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."parent_variant_map"
where parent_variant_map_uuid is not null
group by parent_variant_map_uuid
having count(*) > 1


