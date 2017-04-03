# Building

## Build order (bootstrapping)
Since a large majority of Python modules require setuptools we need to 
bootstrap it and dependencies first so that we can include it.

* python
* appdirs
* pyparsing
* six
* packaging
* setuptools
