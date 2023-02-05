# vim: ft=sls

{#-
    This state will start the {= cookiecutter.abbr_pysafe =} service{! if cookiecutter.config !}
     and has a dependency on ``{= cookiecutter.abbr_pysafe =}.config`` via include list{! endif !}.
#}

include:
  - .running
