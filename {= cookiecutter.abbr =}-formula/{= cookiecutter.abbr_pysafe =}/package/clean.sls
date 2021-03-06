# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

include:
  - {{ sls_config_clean }}

{!- if 'y' == cookiecutter.needs_repo !}
  - {{ slsdotpath }}.repo.clean
{!- endif !}

{= cookiecutter.abbr_pysafe =}-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
