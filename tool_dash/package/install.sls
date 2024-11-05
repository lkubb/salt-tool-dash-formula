# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dash with context %}


Dash is installed:
  pkg.installed:
    - name: {{ dash.lookup.pkg.name }}

Dash setup is completed:
  test.nop:
    - name: Hooray, Dash setup has finished.
    - require:
      - pkg: {{ dash.lookup.pkg.name }}
