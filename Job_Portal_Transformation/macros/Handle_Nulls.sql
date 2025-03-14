{% macro handle_nulls(column_name, default_value) %}
    COALESCE(NULLIF({{ column_name }}, ''), {{ default_value }})
{% endmacro %}