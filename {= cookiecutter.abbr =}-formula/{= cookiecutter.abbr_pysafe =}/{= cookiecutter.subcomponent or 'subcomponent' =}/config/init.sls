# vim: ft=sls

{#-
    This state will configure the {= cookiecutter.abbr_pysafe =} subcomponent{! if cookiecutter.config !} and has a
    dependency on ``{= cookiecutter.abbr_pysafe =}.config`` via include list{! endif !}.
#}
include:
  - .file
