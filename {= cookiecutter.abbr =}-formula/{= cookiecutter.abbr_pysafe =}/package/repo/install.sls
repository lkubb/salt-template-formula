# vim: ft=sls

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as {= cookiecutter.abbr_pysafe =} with context %}

# There is no need for python-apt anymore.

{%- for reponame, enabled in {= cookiecutter.abbr_pysafe =}.lookup.enablerepo.items() %}
{%-   if enabled %}

{= cookiecutter.name =} {{ reponame }} repository is available:
  pkgrepo.managed:
{%-     for conf, val in {= cookiecutter.abbr_pysafe =}.lookup.repos[reponame].items() %}
    - {{ conf }}: {{ val }}
{%-     endfor %}
{%-     if {= cookiecutter.abbr_pysafe =}.lookup.pkg_manager in ["dnf", "yum", "zypper"] %}
    - enabled: 1
{%-     endif %}
    - require_in:
      - {= cookiecutter.abbr_pysafe =}-package-install-pkg-installed

{%-   else %}

{= cookiecutter.name =} {{ reponame }} repository is disabled:
  pkgrepo.absent:
{%-     for conf in ["name", "ppa", "ppa_auth", "keyid", "keyid_ppa", "copr"] %}
{%-       if conf in {= cookiecutter.abbr_pysafe =}.lookup.repos[reponame] %}
    - {{ conf }}: {{ {= cookiecutter.abbr_pysafe =}.lookup.repos[reponame][conf] }}
{%-       endif %}
{%-     endfor %}
    - require_in:
      - {= cookiecutter.abbr_pysafe =}-package-install-pkg-installed
{%-   endif %}
{%- endfor %}
