# vim: ft=sls

{#-
    *Meta-state*.

    This installs the {= cookiecutter.abbr_pysafe =} package{! if cookiecutter.config !},
    manages the {= cookiecutter.abbr_pysafe =} configuration file{! endif !}
    {! if cookiecutter.service !}and then starts the associated {= cookiecutter.abbr_pysafe =} service.{! endif !}
#}

include:
  - .package
{!- if cookiecutter.config !}
  - .config
{!- endif !}
{!- if cookiecutter.service !}
  - .service
{!- endif !}
{!- if cookiecutter.subcomponent !}
  - .{= cookiecutter.subcomponent =}
{!- endif !}
