{% macro remove_special_characters(column_name) %}
    regexp_replace({{ column_name }}, '[^a-zA-Z]', '')
{% endmacro %}
