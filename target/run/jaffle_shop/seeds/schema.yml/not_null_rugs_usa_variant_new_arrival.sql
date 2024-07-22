select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select new_arrival
from "postgres"."public"."rugs_usa_variant"
where new_arrival is null



      
    ) dbt_internal_test