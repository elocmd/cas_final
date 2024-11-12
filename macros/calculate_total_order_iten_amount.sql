
{% macro calculate_total_order_item_amount(price_column,quantity_column) %}
({{quantity_column}}*{{price_column}}) + shipping_cost 
{% endmacro %}
