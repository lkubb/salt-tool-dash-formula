{%- from 'tool-dash/map.jinja' import dash -%}

{%- for user in dash.users | selectattr('dash.license', 'defined') %}
Dash is licensed for user {{ user.name }}:
  file.managed:
    - name: {{ user.home }}/Library/Application Support/Dash/License/license.dash-license
    - contents: |
        {{ user.dash.license | indent(8) }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0600'
    - makedirs: True
{%- endfor %}
