{% macro dbt_custom_log(message,level="info") %}

    {{ log(message,level) }}

    {# log(message,level) #}

{% endmacro %}