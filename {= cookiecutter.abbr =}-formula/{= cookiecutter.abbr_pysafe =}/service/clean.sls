# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

{= cookiecutter.abbr_pysafe =}-service-clean-service-dead:
  service.dead:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.service.name }}
    - enable: False
