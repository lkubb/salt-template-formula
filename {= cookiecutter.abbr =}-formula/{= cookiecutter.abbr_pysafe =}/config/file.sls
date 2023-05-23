# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_package_install = tplroot ~ ".package.install" %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}
{%- from tplroot ~ "/libtofsstack.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

{= cookiecutter.name =} configuration is managed:
  file.managed:
    - name: {{ {= cookiecutter.abbr_pysafe =}.lookup.config }}
    - source: {{ files_switch(
                    ["{= cookiecutter.config.split("/") | last =}", "{= cookiecutter.config.split("/") | last ~ ".j2" =}"],
                    config={= cookiecutter.abbr_pysafe =},
                    lookup="{= cookiecutter.name =} configuration is managed",
                 )
              }}
    - mode: '0644'
    - user: root
    - group: {{ {= cookiecutter.abbr_pysafe =}.lookup.rootgroup }}
    - makedirs: true
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        {= cookiecutter.abbr_pysafe =}: {{ {= cookiecutter.abbr_pysafe =} | json }}
