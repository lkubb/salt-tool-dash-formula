{%- from 'tool-dash/map.jinja' import dash -%}

include:
  - .package
{%- if dash.users | selectattr('dash.license', 'defined') %}
  - .licensed
{%- endif %}
