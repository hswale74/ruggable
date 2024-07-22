
  create view "postgres"."public_staging"."parent_variant_map__dbt_tmp" as (
    with base as (
    Select
        md5(pid || variant) as parent_variant_map_uuid,
        pid as parent_product_id,
        variant as variant_id,
        actual_size,
        weave_feature,
        weave_cat,
        size_grp,
        shipping_size,
        shape,
        cast(weight as float) as weight,
        cast(price as decimal(10,2)) as price,
        cast(msrp as decimal(10,2)) as msrp,    
        case when status = 'In_stock' and not low_stock then False else True end as popular_variant_flag,
        low_stock as low_stock_flag,
        case when new_arrival = 'Y' then true else false end as new_arrival_flag,   
        dw_insert_timestamp::timestamptz as dw_insert_timestamp_utc, --assuming timestamp is in utc at the source
        row_number() over (partition by pid, variant order by dw_insert_timestamp desc) as row_num
    from rugs_usa_variant
)


Select *
from base 
where row_num = 1
  );