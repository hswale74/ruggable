

  create  table "postgres"."public_silver"."rugs__dbt_tmp"
  as (
    Select 
distinct *
from rugs_usa_parent
  );