# vim: ft=sls

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
