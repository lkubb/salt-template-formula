.. _readme:

{= cookiecutter.name =} Formula
{= '=' * cookiecutter.name | length =}========

|img_sr| |img_pc|

.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release
.. |img_pc| image:: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white
   :alt: pre-commit
   :scale: 100%
   :target: https://github.com/pre-commit/pre-commit

Manage {= cookiecutter.name =} with Salt.

.. contents:: **Table of Contents**
   :depth: 1

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

If you need (non-default) configuration, please refer to:

- `how to configure the formula with map.jinja <map.jinja.rst>`_
- the ``pillar.example`` file
- the `Special notes`_ section

Special notes
-------------


Configuration
-------------
An example pillar is provided, please see `pillar.example`. Note that you do not need to specify everything by pillar. Often, it's much easier and less resource-heavy to use the ``parameters/<grain>/<value>.yaml`` files for non-sensitive settings. The underlying logic is explained in `map.jinja`.

Available states
----------------

.. contents::
   :local:

``{= cookiecutter.abbr_pysafe =}``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^

*Meta-state (This is a state that includes other states)*.

This installs the {= cookiecutter.abbr_pysafe =} package,
{!- if cookiecutter.config !}
manages the {= cookiecutter.abbr_pysafe =} configuration file{! endif !}{! if cookiecutter.service !} and then
starts the associated {= cookiecutter.abbr_pysafe =} service.{! endif !}

``{= cookiecutter.abbr_pysafe =}.package``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^^

This state will install the {= cookiecutter.abbr_pysafe =} package only.

{!- if cookiecutter.config !}

``{= cookiecutter.abbr_pysafe =}.config``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^

This state will configure the {= cookiecutter.abbr_pysafe =} {= 'service' if cookiecutter.service else 'package' =} and has a dependency on ``{= cookiecutter.abbr_pysafe =}.install``
via include list.
{!- endif !}

{!- if cookiecutter.service !}

``{= cookiecutter.abbr_pysafe =}.service``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^^

This state will start the {= cookiecutter.abbr_pysafe =} service{! if cookiecutter.config !} and has a dependency on ``{= cookiecutter.abbr_pysafe =}.config``
via include list{! endif !}.
{!- endif !}

``{= cookiecutter.abbr_pysafe =}.clean``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This state will undo everything performed in the ``{= cookiecutter.abbr_pysafe =}`` meta-state in reverse order, i.e.
{!- if cookiecutter.service !}
stops the service,
{!- endif !}
{!- if cookiecutter.config !}
removes the configuration file and
{!- endif !}
then uninstalls the package.

{!- if cookiecutter.service !}

``{= cookiecutter.abbr_pysafe =}.service.clean``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^^^^^^^^

This state will stop the {= cookiecutter.abbr_pysafe =} service and disable it at boot time.
{!- endif !}

{!- if cookiecutter.config !}

``{= cookiecutter.abbr_pysafe =}.config.clean``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^^^^^^^

This state will remove the configuration of the {= cookiecutter.abbr_pysafe =}{!if cookiecutter.service !} service and has a
dependency on ``{= cookiecutter.abbr_pysafe =}.service.clean`` via include list{! else !}package{! endif !}.
{!- endif !}

``{= cookiecutter.abbr_pysafe =}.package.clean``
{= '^' * cookiecutter.abbr_pysafe | length =}^^^^^^^^^^^^^^^^^^

This state will remove the {= cookiecutter.abbr_pysafe =} package{! if cookiecutter.config !} and has a depency on
``{= cookiecutter.abbr_pysafe =}.config.clean`` via include list{! endif !}.

{!- if cookiecutter.subcomponent !}

``{= cookiecutter.abbr_pysafe =}.{= cookiecutter.subcomponent =}``
{= '^' * ((cookiecutter.abbr_pysafe ~ cookiecutter.subcomponent) | length) =}^^^^^

*Meta-state (This is a state that includes other states)*.

This state installs a {= cookiecutter.subcomponent =} configuration file before
configuring{! if cookiecutter.service !} and starting{! endif !} the {= cookiecutter.abbr_pysafe =} {= 'service' if cookiecutter.service else 'package' =}.

``{= cookiecutter.abbr_pysafe =}.{= cookiecutter.subcomponent =}.config``
{= '^' * ((cookiecutter.abbr_pysafe ~ cookiecutter.subcomponent) | length) =}^^^^^^^^^^^^

This state will configure the {= cookiecutter.abbr_pysafe =} subcomponent{! if cookiecutter.config !} and has a
dependency on ``{= cookiecutter.abbr_pysafe =}.config`` via include list{! endif !}.

``{= cookiecutter.abbr_pysafe =}.{= cookiecutter.subcomponent =}.config.clean``
{= '^' * ((cookiecutter.abbr_pysafe ~ cookiecutter.subcomponent) | length) =}^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the {= cookiecutter.abbr_pysafe =} subcomponent{! if cookiecutter.service !}
and reload the {= cookiecutter.abbr_pysafe =} service by a dependency on
``{= cookiecutter.abbr_pysafe =}.service.running`` via include list and ``watch_in``
requisite{! endif !}.
{!- endif !}

Contributing to this repo
-------------------------

Commit messages
^^^^^^^^^^^^^^^

**Commit message formatting is significant!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

pre-commit
^^^^^^^^^^

`pre-commit <https://pre-commit.com/>`_ is configured for this formula, which you may optionally use to ease the steps involved in submitting your changes.
First install  the ``pre-commit`` package manager using the appropriate `method <https://pre-commit.com/#installation>`_, then run ``bin/install-hooks`` and
now ``pre-commit`` will run automatically on each ``git commit``. ::

  $ bin/install-hooks
  pre-commit installed at .git/hooks/pre-commit
  pre-commit installed at .git/hooks/commit-msg

State documentation
~~~~~~~~~~~~~~~~~~~
There is a script that semi-autodocuments available states: ``bin/slsdoc``.

If a ``.sls`` file begins with a Jinja comment, it will dump that into the docs. It can be configured differently depending on the formula. See the script source code for details currently.

This means if you feel a state should be documented, make sure to write a comment explaining it.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``{= cookiecutter.abbr_pysafe =}`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
