Forkk.net Website
=================

This is my personal website and blog.


Development
===========

Building
--------

To build the site, first run `npm install` in both the `uikit` directory and
the project's root directory.


Editing
-------

If you plan on using docpad's automatic recompiling system (i.e. `docpad run`,
make sure your editor has swapfiles turned off. There is a bug in docpad and
watchr which causes saving to be interpreted as 3 separate changes to a file 
when using an editor with swapfiles enabled.

Another workaround is to set the `catchupDelay` option in docpad's watch
options to ~2 seconds. This is the default behavior, but I like to see changes
quickly, so I opted for the "disable swapfiles" solution.

