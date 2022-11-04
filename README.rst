.. image:: https://img.shields.io/badge/dmtn--243-lsst.io-brightgreen.svg
   :target: https://dmtn-243.lsst.io
.. image:: https://github.com/lsst-dm/dmtn-243/workflows/CI/badge.svg
   :target: https://github.com/lsst-dm/dmtn-243/actions/

#############################################################
Qserv: A Distributed Petascale Database for the LSST Catalogs
#############################################################

DMTN-243
========

Qserv is a distributed, shared-nothing, SQL database system being developed by the Vera Rubin Observatory to
host the multi-petabyte astronomical catalogs that will be produced by the LSST survey. Here we sketch the
basic design and operating principles of Qserv, and provide some updates on recent developments.

Links
=====

- Live drafts: https://dmtn-243.lsst.io
- GitHub: https://github.com/lsst-dm/dmtn-243

Build
=====

This repository includes lsst-texmf_ as a Git submodule.
Clone this repository::

    git clone --recurse-submodules https://github.com/lsst-dm/dmtn-243

Compile the PDF::

    make

Clean built files::

    make clean

Updating lsst-texmf
-------------------

`lsst-texmf`_ includes BibTeX files, the ``lsstdoc`` class file, and acronym definitions, among other
essential tooling for LSST's LaTeX documentation projects. To update to a newer version of `lsst-texmf`_, you
can update the submodule in this repository::

   git submodule update --init --recursive

Commit, then push, the updated submodule.

.. _lsst-texmf: https://github.com/lsst/lsst-texmf
