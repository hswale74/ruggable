select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        new_arrival as value_field,
        count(*) as n_records

    from "postgres"."public"."rugs_usa_variant"
    group by new_arrival

)

select *
from all_values
where value_field not in (
    'Y','N'
)



      
    ) dbt_internal_test