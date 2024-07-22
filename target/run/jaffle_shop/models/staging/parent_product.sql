
  create view "postgres"."public_staging"."parent_product__dbt_tmp" as (
    --making a simple dimension table for parent product

Select distinct
pid as parent_product_id,
thickness,
material,
weave_feature,
brand,
category
from rugs_usa_parent
  );