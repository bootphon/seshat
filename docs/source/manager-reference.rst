================================
The Campaign Manager's Reference
================================

In this page, we define and explain the terms introduced in Seshat. Think of this page
as Seshat's rulebook.

.. _audio-corpus:

Audio Corpus
------------
A set of audio/speech files that a :ref:`campaign-manager` wants to annotate.
It is indicated either by a folder containing sound files, or by a CSV summarizing a set of files.
Seshat support the same formats as Praat so far: WAV, Flac and MP3.

For more information on how to format your audio corpora and import them into seshat, take a look at :any:`corpus`

.. _campaigns:

Annotation Campaigns
--------------------

An object that enables the :ref:`campaign-manager` to assign :ref:`annotation-tasks`
to the :ref:`annotators`. It references an :ref:`audio-corpus`, and allows the
Manager to track the annotation's tasks progress and completion in real time.

.. todo : properties of a campaign, and configuration properties

.. _textgrid-checking-scheme:

Textgrid Checking Scheme
------------------------

A set of rules defining the TextGrid files' structure and content of the annotations.
It is set at the beginning of the :ref:`campaigns`'s creation,
and is used to enforce that all TextGrids from the campaign contain the same amount of Tiers,
with the same names. It can also enforce, for certain chosen tiers, a set of valid annotations.

.. todo : specify rigorously the different checking scheme mechanics.

.. _annotation-tasks:

Annotation Tasks
----------------

It is contained in an :ref:`campaigns`, it references an audio file from the campaign's designated
:ref:`audio-corpus`}, and assigned to :ref:`annotators`. It can either be a *Single annotator Task*
(assigned to one Annotator) or a *Double Annotator Task* (assigned to two annotators,
who will annotatote the assigned task in parallel).

Single Annotator Tasks
++++++++++++++++++++++

.. todo

Double Annotators Tasks
+++++++++++++++++++++++

.. todo

.. _campaign-manager:

Campaign Manager
----------------

Users with the rights to create :ref:`campaigns` and :ref:`annotators` user accounts,
and assign :ref:`annotation-tasks` to :ref:`annotators`.

.. todo : campaign subscrition mechanics

.. _annotators:

Annotators
----------

Users who are assigned a set of :ref:`annotation-tasks`.
Their job is to complete the annotation of the audio files with the Praat software.
If the TextGrid file they submit does not comply with their :ref:`annotation-tasks`'s
:ref:`textgrid-checking-scheme`, Seshat pinpoint their annotation errors with detailed messages.
The annotator can re-submit the concerned file to the platform based on these different feedbacks.

.. todo:


