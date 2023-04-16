# vim: ft=sls

{#-
    Undoes everything performed in `{= cookiecutter.abbr_pysafe =}.{= cookiecutter.subcomponent =}`_ in reverse order, i. e.
    removes the {= cookiecutter.abbr_pysafe =} {= cookiecutter.subcomponent =} configuration.
#}

include:
{!- if cookiecutter.subcomponent_config !}
  - .config.clean
{!- else !}
  []
{!- endif !}
