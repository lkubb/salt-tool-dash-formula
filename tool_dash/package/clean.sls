# vim: ft=sls

{#-
    Removes the Dash package.
#}

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dash with context %}


Dash is removed:
  pkg.removed:
    - name: {{ dash.lookup.pkg.name }}
