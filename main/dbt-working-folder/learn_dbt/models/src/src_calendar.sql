{{
    config(
        materialized='table'
    )
}}

with raw_calendar as (

    Select * from {{source('airbnb','raw_calendar')}}

)

Select * from raw_calendar