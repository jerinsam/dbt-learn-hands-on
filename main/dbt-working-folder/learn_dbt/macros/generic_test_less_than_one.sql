{% test generic_test_less_than_one(model,column_name) %}
    
    Select * from {{model}}
    where {{column_name}} < 1

{% endtest %}