# vim: ft=sls

{#-
    Removes the configuration of the {= cookiecutter.abbr_pysafe =} {= cookiecutter.subcomponent =} subcomponent{! if cookiecutter.service !}
    and reloads the {= cookiecutter.abbr_pysafe =} service by a dependency on
    `{= cookiecutter.abbr_pysafe =}.service.running`_ {! endif !}.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{!- if cookiecutter.service !}
{%- set sls_service_clean = tplroot ~ ".service.clean" %}
{!- endif !}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

{!- if cookiecutter.service !}

include:
  - {{ sls_service_clean }}
{!- endif !}

{= cookiecutter.abbr_pysafe =} {= cookiecutter.subcomponent =} config is absent:
  file.absent:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.{= cookiecutter.subcomponent =}.config }}
{!- if cookiecutter.service !}
    - watch_in:
        - sls: {{ sls_service_clean }}
{!- endif !}
