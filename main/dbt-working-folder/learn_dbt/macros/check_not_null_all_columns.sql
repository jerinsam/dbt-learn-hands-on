{% macro check_not_null_all_columns(model) %}
    SELECT * FROM {{model}} WHERE 
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{col.column}} IS NULL OR 
    {% endfor %}
    1=2
{% endmacro %}