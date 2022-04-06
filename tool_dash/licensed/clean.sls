# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as dash with context %}


{%- for user in dash.users | selectattr('dash.license', 'defined') | selectattr('dash.license') %}

Dash is not licensed for user {{ user.name }}:
  file.absent:
    - name: {{ user._dash.datadir | path_join('License', 'license.dash-license') }}
{%- endfor %}
