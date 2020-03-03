![Seshat Logo](docs/images/logo_title.png)

*Seshat was the ancient Egyptian goddess of wisdom, knowledge, and writing. 
 She was seen as a scribe and record keeper, and her name means she who scrivens (i.e. she who is the scribe), and is credited with inventing writing.*

# Seshat Annotation Manager

[![Documentation](https://readthedocs.org/projects/seshat-annotation/badge/?version=latest)](https://seshat-annotation.readthedocs.io/en/latest/)

This is the main repository for the Seshat Annotation Management platform.

**What is Seshat?**

Seshat is a **self-hosted**, **web-based** platform to help linguists and speech specialists organize and manage annotation campaigns 
on audio/speech corpora of any size. It works hand-in-hand with the **Praat** annotation software.

**Why should you use Seshat?**

Seshat eases the assignation of annotation tasks to a pool of annotators.
It allows the annotation manager to track the advancement of a corpus's annotation.

**Ok, i'm interested, but is that it?** 

*Of course not*. Its flexible and easy-to-configure TextGrid checking system will help you 
ensure that all annotated files are free of human annotation errors and files mixup.
It also provides you with double-annotator annotation schema that will allow you to 
automatically get inter-annotator agreement metrics for your corpora.

**You have my attention. But how hard is it to use?**

Easy as English verb conjugation! We've put some extra care in making Seshat easy to set-up 
and easy to use, even for non-technical users.
We also made sure that the annotator's interface is as helpful as possible for them, 
so they can focus on annotating and not on figuring out if they're annotating right.

![Seshat Screen](docs/images/campaign_view_screen.png)


## Installing Seshat

We provide two ways to install Seshat:

* A simple [Docker-based install](https://seshat-annotation.readthedocs.io/en/latest/install.html) for non-technical 
  users.
* A [manual and custom install](https://seshat-annotation.readthedocs.io/en/latest/install.html) for 
  those who like to have a fine control over their system.

## Contributing to Seshat

Your help is needed! First, if you have any troubles or need any help using/installing Seshat, 
post an issue and we'll try our best to help you solve it.

If you're willing to contribute with code, you should probably submit an issue with your 
idea first so we can guide you through it.

## Citing Seshat

If you're using Seshat, here's the citation you should use:

```
@inproceedings{titeux:hal-02496041,
  TITLE = {{Seshat: A tool for managing and verifying annotation campaigns of audio data}},
  AUTHOR = {Titeux, Hadrien and Riad, Rachid and Cao, Xuan-Nga and Hamilakis, Nicolas and Madden, Kris and Cristia, Alejandrina and Bachoud-L{\'e}vi, Anne-Catherine and Dupoux, Emmanuel},
  URL = {https://hal.archives-ouvertes.fr/hal-02496041},
  BOOKTITLE = {{LREC}},
  ADDRESS = {Marseilles, France},
  YEAR = {2020},
  MONTH = May,
  KEYWORDS = {speech transcription ; speech corpora ; annotations management},
  PDF = {https://hal.archives-ouvertes.fr/hal-02496041/file/Seshat_2020_LREC_2020_Paper_Titeux_et_al__Final.pdf},
  HAL_ID = {hal-02496041},
  HAL_VERSION = {v1},
}
```
