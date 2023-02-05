# vim: ft=sls

{#-
    Manages the {= cookiecutter.abbr_pysafe =} {= 'service' if cookiecutter.service else 'package' =} configuration.
    Has a dependency on `{= cookiecutter.abbr_pysafe =}.package`_.
#}

include:
  - .file
