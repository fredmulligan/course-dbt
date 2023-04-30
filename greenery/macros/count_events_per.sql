{% macro count_events_per(table_name, groupby_column, distinct_column) %}
  {% if execute %}
    {% set distinct_values_query %}
      SELECT DISTINCT {{ distinct_column }}
      FROM {{ table_name }}
    {% endset %}

    {% set results = run_query(distinct_values_query) %}
    {% set distinct_values = results.columns[0].values() %}

    SELECT
      {{ groupby_column }},
      {% for value in distinct_values %}
        COUNT(CASE WHEN {{ distinct_column }} = '{{ value }}' THEN 1 ELSE NULL END) as number_of_{{ value }}{% if not loop.last %}, {% endif %}
      {% endfor %}
    FROM {{ table_name }}
    GROUP BY {{ groupby_column }}
  {% endif %}
{% endmacro %}

select 1 -- dummy SQL for parsing stage