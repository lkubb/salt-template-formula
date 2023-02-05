# vim: ft=sls

{#-
    *Meta-state*.

    This state will undo everything performed in the ``{= cookiecutter.abbr_pysafe =}`` meta-state
    in reverse order, i.e. {! if cookiecutter.service !}
    stops the service,{! endif !} {!- if cookiecutter.config !}
    removes the configuration file and then
    {!- endif !}
    uninstalls the package.
#}

include:
{!- if cookiecutter.subcomponent !}
  - .{= cookiecutter.subcomponent =}.clean
{!- endif !}
{!- if cookiecutter.service !}
  - .service.clean
{!- endif !}
{!- if cookiecutter.config !}
  - .config.clean
{!- endif !}
  - .package.clean
