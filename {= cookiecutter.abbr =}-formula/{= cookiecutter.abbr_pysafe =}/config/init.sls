# vim: ft=sls

{#-
    This state will configure the {= cookiecutter.abbr_pysafe =} {= 'service' if cookiecutter.service else 'package' =}
    and has a dependency on ``{= cookiecutter.abbr_pysafe =}.install`` via include list.
#}

include:
  - .file
