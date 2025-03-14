{% macro remove_numbers(column) %}
    regexp_replace({{ column }}, '[0-9]', '')
{% endmacro %}
