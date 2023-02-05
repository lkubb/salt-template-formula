# vim: ft=sls

{#-
    Starts the {= cookiecutter.abbr_pysafe =} service and enables it at boot time.
    Has a dependency on `{= cookiecutter.abbr_pysafe =}.{= "config" if cookiecutter.config else "package" =}`_.
#}

include:
  - .running
