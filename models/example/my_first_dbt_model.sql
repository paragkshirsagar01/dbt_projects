{{
    config(
        materialized='incremental'
    )
}}
with cte as(select first_name,{{rupee_to_dollar('salary')}} as sal_fract from employees)
select * from cte

-- {% if is_incremental() %}

--   -- this filter will only be applied on an incremental run
--   -- (uses >= to include records whose timestamp occurred since the last run of this model)
--   -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
-- where event_time >= (select coalesce(max(event_time),'1900-01-01') from {{ this }} )

-- {% endif %}