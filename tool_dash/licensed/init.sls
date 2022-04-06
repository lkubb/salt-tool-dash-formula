# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as dash with context %}

include:
  - {{ sls_package_install }}

{%- for user in dash.users | selectattr('dash.license', 'defined') | selectattr('dash.license') %}

Dash is licensed for user {{ user.name }}:
  file.managed:
    - name: {{ user._dash.datadir | path_join('License', 'license.dash-license') }}
    - contents: |
        {{ user.dash.license | indent(8) }}
    - user: {{ user.name }}
    - group: {{ user.group }}
    - mode: '0600'
    - makedirs: true
    - require:
      - sls: {{ sls_package_install }}
{%- endfor %}
