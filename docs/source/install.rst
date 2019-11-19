=================
Installing Seshat
=================

We've made the installation of Seshat as simple as possible.

* If you don't have access to a Linux server or have very sparse knowledge of how to set up a web server and
  configure it, you should follow the :ref:`docker-install` procedure. This also goes for more seasoned linux users
  that don't want to go through the hassle of setting up each parts of the server and client manually.
* If you like to have a finer control of your system and/or don't want to deal with Docker, follow the
  :ref:`manual-install`

These two tutorial will help you Seshat on your machine, it will thus be only accessible **to your or users on your local
network**. If you want Seshat to be reachable from the web, follow :ref:`web-access` after installing.

.. _docker-install:

Docker Install (Easy way)
========================

This type of install should work on any machine, regardless of the OS (Windows, Mac, Linux, although Unix systems are prefered),
as long as you have the following requirements:

* A working install of Docker (we know it works with Docker 19.03 and later, it might work with earlier versions). If
  you don't have Docker installed, follow its
  `install instructions <https://docs.docker.com/v17.09/engine/installation/>`_.
* If you installed docker on Linux (namely, Ubuntu) make sure that you have
  `docker-compose <https://docs.docker .com/compose/install/>`_ installed as well.
* You should also also have Git installed on your system, to retrieve Seshat's sources. If you don't, follow
  `these intructions <https://git-scm.com/book/en/v2/Getting-Started-Installing-Git>`_.

.. note:: On a linux system, you should make sure your current user has the right to run Docker images (by running
  ``docker run hello-word`` for instance . If that isn't the case, follow
  `these instructions <https://docs.docker.com/v17.09/engine/installation/linux/linux-postinstall/>`_.

Once all these prerequisites are all installed, open a terminal, and retrieve the full Seshat sources

.. code-block:: bash

    git clone --recurse-submodules git@gitlab.coml.lscp.ens.fr:ezhealth/seshat-lrec/seshat.git

Then, change the current directory to seshat's previously cloned directory

.. code-block:: bash

   cd seshat/

Once you're in that folder, edit (using any text editor) the ``docker-compose.yml`` file

.. literalinclude:: ../../docker-compose.yml
    :linenos:
    :language: yaml

Edit all the parameters defining the first admin's accounts properties:

* For the username ``ADMIN_USERNAME`` use alphanumerical characters
* The password ``ADMIN_PASSWORD`` should be at least 8 characters long
* The email defined in ``ADMIN_EMAIL`` should be a valid email address. If you don't want to put any, just leave the
  default one.
* Regarding the ``FIRST_NAME`` and ``LAST_NAME`` variables, any string will do

.. note:: It's important that you set your password to something secure. **Do not** ignore this step and leave
   the example password preset.

**Optionally**, you can set the "magic" corpora/dataset folder to something else than the default by replacing the
default value ``./corpora`` by your own. For instance here it's the path ``~/data/mycorpora/``:

.. code-block:: yaml

   volumes:
      # set the dataset mounting point
      - ~/data/mycorpora/:/api/corpora

Once that is done, still in the ``seshat/`` folder, tell docker to build and run your local image.
The build part might take some time.

.. code-block:: bash

    docker-compose build
    docker-compose up

This will automatically download the required Docker images, install them and setup Seshat and its database in a
Docker environment. Once you see the message the following messages displayed in your terminal, it means it's finished.

.. code-block::

    seshat    | 2019-11-19 12:40:36,460 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
    seshat    | 2019-11-19 12:40:36,460 INFO success: uwsgi entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)


Test your access to the now active application by reaching the address `<http://localhost:4200>`_ in your browser.
Check that you can log in with the username and password you specified in the configuration file.
You can now add audio corpora to Seshat, so you can start your first annotation campaign.
Check that your corpora is in line with :any:`corpus`, and just drop it in the ``corpora``
folder (still in Seshat's current folder), or any other corpora folder that you set up during the configuration.

Once that is done, you can start using Seshat, or learn how to use it in the :any:`manager`.

.. note:: You can cut the running docker images with Ctrl-C. If you want them to run in the background,
   run ``docker-compose up -d`` (the ``-d`` stands for daemon).

.. _manual-install:

Manual Install
==============

This type of install is advised if you're good enough as a Linux system administrator,
and don't want to have to deal with Docker. It's considerably easier to tweak and customize the install
with this kind of installation.

This install is for an Ubuntu 18.04 environment (it could potentially work on other environments distributions or MacOS
but has not been thoroughly tested).
We here assume that your system has the following requirements:

* A working python 3.6>= (default Python version on Ubuntu 18.04)
* A working nodeJS 12.3>= install
* A mongoDB 3.6>= install (it could work with earlier versions)
* An ffmpeg install

Moreover, the advised web server to act as a web frontend is **Nginx**.

Preliminaries
-------------

First of all, clone the full seshat project and ``cd`` into it

.. code-block:: bash

    git clone --recurse-submodules git@gitlab.coml.lscp.ens.fr:ezhealth/seshat-lrec/seshat.git
    cd seshat/

Setting up the API (server)
---------------------------

First, ``cd`` into the server's directory, set up a python virtual environment, and install the seshat package:

.. code-block:: bash

    cd server/
    python3 -m venv venv/
    . venv/bin/activate
    python setup.py install

You should be able to run the server now, by running:

.. code-block:: bash

    python app.py

Check that it is running by reaching the address `<http://localhost:5000/doc/swagger>`_. You should see a page
displaying a description of Seshat's RESTful API.

Setting up the client
---------------------

Now go to the client's directory (assuming you're still in the server's directory). Then, install the npm
dependencies and compile the client's Angular Typescript code into JavaScript:

.. code-block:: bash

    cd ../client/
    npm install
    npm run build --prod true --outputPath=../server/static/

Now go back to the server's directory, and run ``python app.py`` again. If you reach the address
`<http://localhost:5000/>`_, your should get Seshat's login page.

Creating a manager's account
----------------------------

Still in the server's virtual environment, run the command (whilst replacing the example values with your own)

.. code-block:: bash

    add-manager manager_username manager_password manager@email.com --first_name Manager --last_name Mister

If you go back to the `<http://localhost:5000/>`_ page, you should now be able to login with the supplied username
and password. At this point, your installation of Seshat is fully usable, albeit not very practical.

You can drop corpus files in the default ``server/corpora/`` folder for Seshat to use for annotation. Be sure to
comply with the :any:`corpus`.

Having Seshat as a Daemon
-------------------------

Having to launch Seshat by hand each time you use it isn't very practical. If you're willing to have Seshat an
automatic launch of Seshat when your machine (or server) boots, follow these steps to have Seshat "daemonized" using
SystemD. Note that if you wish to have seshat served by nginx, it's one of the required steps, thus, this isn't
wasted time in any way.

First, make sure you have no already running instance of Seshat (as it will conflict with the deamonized one if their
ports are the same).

Edit the ``seshat.service`` found in the ``install/`` folder of the clone repository, configuring it with your
own paths and your own username:

.. literalinclude:: ../../install/seshat.service
    :linenos:
    :language: conf

Then, copy that file to systemd's services directory, and start the deamon:

.. code-block:: bash

    sudo cp install/seshat.service /etc/systemd/system/seshat.service
    sudo systemctl start seshat.service
    sudo systemctl status seshat.service

The last command should say that seshat's service is active.
Seshat should now be running on the same address as usual, `<http://localhost:5000/>`_.


If you wish to have Seshat running on boot, run:

.. code-block:: bash

    sudo systemctl enable seshat.service

