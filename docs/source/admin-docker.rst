=====================================
Administering A Docker Seshat Install
=====================================

Managing Seshat
===============

Here, we'll teach you how to manage Seshat as the administrator, **not as the campaign manager**, on a **Docker**
install of seshat.

.. _add-corpora-docker:

Adding Audio Corpora
--------------------

Seshat's corpora folder is where you should drop your audio corpora. It's set up in your ``docker-compose.yml``
file. If you left it unchanged, it should be the ``corpora/`` folder in seshat's clone repository. Else,
it's the left side of the line:

.. code-block:: yaml

    volumes:
      # here it's '~/datasets/' for instance
      - ~/datasets/:/app/corpora

You should then just drop **corpus's folder (or CSV file) inside the special corpora folder**, not your corpus's content.
For instance, say you have 3 corporas, corresponding to 3 folders, then your special `corpora/` folder should
look like that::

    corpora/ <--- this is seshat's "magic" folder
    ├── some_corpus_summary.csv
    ├── corpus_1
    │   └── some files...
    ├── corpus_2
    │   └── some other files...
    └── corpus_3
        └── some more files...

After you've dropped a new corpus, or updated a corpus (by adding files to it) into seshat's `corpora/` folder,
you should then reach Seshat's "Corpora" page and refresh either the corpora list or the corpus's content:

.. figure::  ../images/corpora_refresh.png
   :align:   center

.. _reaching-image:

Reaching your Seshat Docker image
---------------------------------

To reach into your Seshat docker, run

.. code-block:: bash

    docker exec -it seshat /bin/sh

If that doesn't work, list your running docker images with the following command, and check
that a seshat docker is indeed running.

.. code-block:: bash

    docker ps

.. note::You docker image contains (by default) a python environment with all of seshat's dependency installed,
   and the ``seshat-server`` package installed as well (the python package for seshat's different tools and libraries).


Creating Manager Accounts
-------------------------

Let's say you want to add another manager's account with the following properties::

    First/lastname : Provençal Le Gaulois
    Email : provencal.gaulois@gmail.com
    Login : provencal
    Password : freewales

First, :ref:`reach into your docker image <reaching-image>`. Then, just run the command::

    add-manager provencal freewales provencal.gaulois@gmail.com --first_name Provençal --last_name Le Gaulois

.. _web-access:

Setting up Seshat to be accessible from the web
-----------------------------------------------


Advanced Features for Seshat
============================

For these features, it's advised to have some basic knowledge of python, and especially of the Python toolchain
(pip, environments and python packages).


Adding custom parsers
---------------------

If you want to know how to implement your own annotation parser (used to check annotations in a specific Tier),
you should `visit the template's page <https://github.com/bootphon/seshat-parser-template>`_.

If you've already implemented a parser, or found one that fits your need and want to use it. Let's now install it.
First, :ref:`reach into your docker image <reaching-image>`. We can now install your parser package.
The install command is dependant on the type of package for your parser, but there usually are only two
possibilities:

- Your parser package is in a github repository (most likely): run ::

    pip install git+git://github.com/myuser/seshat-parser-myparser

- Your parser package is hosted on pypi (regular type of install but rare for small custom packages): run::

    pip install seshat-parser-parsername

Your parser package should now be installed in seshat's python environment and automatically detected by the platform.
You should be able to find its installed parsers in the campaign creation view, when creating tier. However, if you
wish to check that your parser-package is effectively detected by seshat, and a that the parsers it makes avaible
have a valid implementation, you can run ::

    check-parser --list

This will show you all detected parser names. You can check an individual parser by running::

    check-parser --parser ParserName

Using the Seshat CLI
--------------------

Using the RESTful API
---------------------


