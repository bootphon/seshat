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

Campaign Configuration
++++++++++++++++++++++

When creating a campaign, there are a small number of properties you can configure, which will be explained here.
Let's see a screenshot of the campaign creation interface:


.. figure::  ../images/campaign_creation_annotated.png
   :align:   center

   The campaign creation interface.

Let's go over the different parts of this interface, highlighted by the red boxes:

1. This is where you set the campaign's basic properties:

    * Its name (from which a *slug* will be computed, and will serve as the campaign's unique ID).
      Make sure to keep that name different from other campaigns to prevent mixing them up.
    * Its corpus. This is where you pick the :ref:`audio-corpus` (previously put in Seshat's ``corpora/`` folder).
    * Its description. This has no particular effect of the behavior of Seshat. It's just there to remind you what
      this campaign is about. Keep it short and informative.

2. This button asks Seshat to refresh the list of detected corpora. Seshat will go over all the files in its ``corpora/``
   folder and if new corpora are detected, will start to track them. This might be useful if you recently added a corpus
   to Seshat, and it hasn't been automatically detected. **If an added corpus is large, lots of files or big audio files,
   this make take a bit of time**.
3. This is to set whether or not the annotators will be given the corpus's audio file when being assigned
   an annotation task. Note that they'll have only access to the audio files they've been assigned to.
4. This is to set the :ref:`textgrid-checking-scheme` for that campaign. Proceed to that section to understand how it
   works.

Campaign Properties
+++++++++++++++++++

Once a campaign is created, you'll be able to see it in the campaigns list. You can view a full summary of a
campaign's properties by clicking on the *View* button. This is what you should see:

.. figure::  ../images/campaign_view.png
   :align:   center

   The campaign status

Let's go over the different Informations that are displayed in this view:

* **Tasks** : Number of completed :ref:`annotation-tasks` vs total number of assigned tasks.
  This progress bar is here to help you track the advancement of your campaign.
* **Files** : Number of files with an assigned :ref:`annotation-tasks` vs total number of files in the campaign's designated
  corpus. This is to give you a sense of how much of your corpus has been covered by the campaign.
* **Description** : This is the corpus description set at the campaign's creation.
* **Corpus** : This is the name of the corpus that you picked at the campaign's creation. All tasks assignments
  will be on files from that corpus.
* **Annotators** : This is a list of all the annotators that have received :ref:`annotation-tasks` in this campaign.
  This is automatically computed by Seshat.
* **Checking Scheme** : A short summary of this campaign's :ref:`textgrid-checking-scheme`, if you set any.
* **Actions** : Button to retrieve a structured archive (zip file) of all the task's textgrids, along with a CSV
  summary of the TextGrid's creation.
* **Other Actions** : For now, the only possible action is to edit the campaign's wiki page, which we will explain
  in the next section.

.. note:: Apart from the wiki page's content and assigning tasks, none of the campaigns' properties can be edited.
   The most important field where this is enforced is the campaign's :ref:`textgrid-checking-scheme`. This is to
   ensure that all TextGrid files submitted to a campaign are of "cast in the same mould". If you wish to use
   another (even slightly different) checking scheme, create another campaign with a new scheme.

Campaign Wiki Page
++++++++++++++++++

Each campaign has a wiki page which can be edited in Seshat's interface (by clicking on the aforementioned
"Edit Campaign Wiki" button, in the campaign's status page). Wiki pages are edited using a markup langage
called *MarkDown*.

.. figure::  ../images/campaign_wiki.png
   :align:   center

   The campaign's wiki page edition form.

The campaign wiki page is aimed at being a useful help page for annotators working on :ref:`annotation-tasks`.
They can access it when working on an annotation task, from their own interface, along with an automatically
generated description of the :ref:`textgrid-checking-scheme` their files should conform to (if there's any such
scheme for that campaign) .
You should use this as a way to provide them with instructions on how to annotate the campaign's audio files.

Let's go over this interface's functionalities:

* **Wiki Content** : this is the wiki's MarkDown code. This is where you should edit the wiki page's content.
* **Preview** : This is where you see how the wiki page is rendered to the annotators.
* **Formatting Guide** : this is a short cheat sheet on how to use the MarkDown markup language. We kept it
  pretty short, thus, if you want to do some more complicated things with it, you should refer to
  `the official documentation <https://daringfireball.net/projects/markdown/syntax>`_

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


