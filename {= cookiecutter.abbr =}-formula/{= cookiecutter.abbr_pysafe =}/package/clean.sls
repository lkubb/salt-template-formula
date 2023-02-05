# vim: ft=sls

{#-
    Removes the {= cookiecutter.abbr_pysafe =} package{! if cookiecutter.config !}.
    Has a depency on `{= cookiecutter.abbr_pysafe =}.config.clean`_{! endif !}.
#}

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

include:
  - {{ sls_config_clean }}

{!- if 'y' == cookiecutter.needs_repo !}
  - {{ slsdotpath }}.repo.clean
{!- endif !}

{= cookiecutter.name =} is removed:
  pkg.removed:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
