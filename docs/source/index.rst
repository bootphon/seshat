.. Seshat Tutorial documentation master file, created by
   sphinx-quickstart on Tue Nov  5 14:30:50 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Seshat Tutorial's documentation!
===========================================

The Seshat annotation manager is a simple system for the automated management of annotation campaigns of speech data.
It enables a campaign manager to assign annotation tasks to a pool of annotators, and ensure that annotations all
comply with a predefined annotation Schema, easily created through Seshat's campaign creation interface.

* If you're willing to learn how to install Seshat, proceed to :any:`install`
* If you want to add annotations corpora to an already-installed instance of Seshat,
  proceed to the :any:`admin-docker` or :any:`admin-manual` depending on your type of installation.
* If you're a campaign manager and wish to learn how to create annotation campaigns and manage them,
  proceed to the :any:`manager-tutorial`.

.. toctree::
   :maxdepth: 2
   :caption: Administrator's Guide:

   install
   manager
   corpus
   admin-docker
   admin-manual

.. toctree::
   :maxdepth: 2
   :caption: Campaign manager's Guide:

   manager-tutorial
   manager-reference