# vim: ft=sls

{#-
    Manages the {= cookiecutter.abbr_pysafe =} {= cookiecutter.subcomponent =} configuration.
#}

include:
{!- if cookiecutter.subcomponent_config !}
  - .config
{!- else !}
  []
{!- endif !}
