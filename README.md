HomelessShelter
===============

Some scripts for building Mono build and deploy environments through Vagant (for Windows and Debian)

Software source selection:
(i) = install scripts
(v) = vagrant file / chef recipe

Software that gets installed:
-----------------------------
(i) VirtualBox
(i) Ruby
(i) Ruby DevKit
(i) GEMS: Vagrant, Bundler

(v) Mono, (java, nginx --> ready but not hooked in)


TODO
====
Vagrant image doesn't get enough RAM. First 'vagrant up' fails, need to up RAM in VBox manager gui.
Should be able to adjust this somewhere but don't know how!
