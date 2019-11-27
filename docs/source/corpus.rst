==============================
Seshat Audio Corpus Management
==============================

Supported Corpus Formats
========================

Seshat supports two types of audio corpora:

* The :ref:`file-based-corpus` (audio files in a folder hierarchy)
* The :ref:`csv-based-corpus` summaries

.. _file-based-corpus:

File Based Corpus
-----------------

This kind of corpus is just a file hierarchy with audio files in it. Structure doesn't matter, Seshat will just
look (*recursively*) for all files matching an audio extension (`.wav`, `.ogg`, `.flac`, `.mp3`), and consider them
to be corpus files. You just have to "drop" that audio folder in the folder you defined as `corpora`.

It's however advised to have a hierarchical structure that describes best your data, as the path to the file will
be used as its name when assigning task. Consider for instance the following two small yet **valid** corpora:

One of people saying things::

    corpus_people/
    ├── female
    │   └── mary
    │       ├── 001.wav
    │       ├── 002.wav
    │       └── 003.wav
    └── male
        ├── henry
        │   ├── tis_but_stratch.wav
        │   └── what_is_your_quest.wav
        └── john
            ├── 001_hello.wav
            ├── 001_water.wav
            └── 003.wav


Then, let's also consider a corpus of bird songs::

   corpus_birds/
    ├── unknown_1.wav
    ├── unknown_2.mp3
    ├── summary.docx
    ├── blackbird
    │   ├── 001.wav
    │   ├── 002.ogg
    │   ├── 003.wav
    │   └── 004.wav
    ├── nightingale
    │   ├── 001.flac
    │   ├── 002.wav
    │   └── 003.wav
    └── northern_cardinal
        ├── 001.mp3
        └── 002.wav

As you can see, there are no constraints on the file structure, the number of files, or the naming of these files
(however, for your own sake, please keep some consistency in your naming conventions). You can also notice that there
is a ``docx`` file thrown in there, that Seshat will just ignore.

The corpus's root folder will be used as the corpus's name by seshat, e.g. here, it's corpus_people and corpus_bird.

.. _csv-based-corpus:

CSV based Corpus
-----------------

If you don't want to have the actual files from your corpus on the same machine as the Seshat website (for security
reasons for instance), you can still provide seshat with a CSV file that summarizes your corpus. It only requires
**two** columns: one for the file ID (idealy, human readable and descriptive, not a md5 hash), and its duration
in seconds.

For instance, this is a valid csv ``people_talking.csv``:

.. code-block:: csv

    filename, duration
    john_001.wav, 13.432
    john_002.wav, 10.13
    john_003.wav, 42.045
    mary_001.wav, 9.454
    mary_002.wav, 2.43

The CSV file's name will be used as the corpus name by seshat, e.g., here it'll be people_talking.

.. note:: For CSV-based corpora, Seshat won't (quite naturally) be able to serve the audio files to the annotator,
  as they aren't available (even if you use a valid path as the file name).

Importing Your Corpora to Seshat
================================

Importing a corpus to Seshat is a easy as dropping (or copying) a your folder or CSV file to Seshat's `corpora/` folder.
You should go to :any:`Import a Corpus (Docker Install) <add-corpora-docker>` or
:any:`Import a Corpus (Manual Install) <add-corpora-manual>` depending on your install
to learn how to do that.