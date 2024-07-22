select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    parent_product_uuid as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."parent_product"
where parent_product_uuid is not null
group by parent_product_uuid
having count(*) > 1



      
    ) dbt_internal_test