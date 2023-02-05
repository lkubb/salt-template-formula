# vim: ft=sls

{#-
    This state will remove the configuration of the {= cookiecutter.abbr_pysafe =}{! if cookiecutter.service !} service and has a
    dependency on ``{= cookiecutter.abbr_pysafe =}.service.clean`` via include list{! else !}package{! endif !}.
#}

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

{!- if cookiecutter.service !}

include:
  - {{ sls_service_clean }}
{!- endif !}

{= cookiecutter.abbr_pysafe =} configuration is absent:
  file.absent:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.config }}
{!- if cookiecutter.service !}
    - require:
      - sls: {{ sls_service_clean }}
{!- endif !}
