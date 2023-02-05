# vim: ft=sls

{#-
    Configures the {= cookiecutter.abbr_pysafe =} subcomponent{! if cookiecutter.config !} and has a
    dependency on `{= cookiecutter.abbr_pysafe =}.config`_ via include list{! endif !}.
#}
include:
  - .file
