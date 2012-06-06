HomelessShelter
===============

Some scripts for building Mono build and deploy environments through Vagant (for Windows and Debian)

Windows install scripts are long and complex-- some NuGet magic might help?
##Run the windows install scripts from within the powershell host if you get a "Test-Path : The specified path, file name, or both are too long" message##

Software source selection:
(i) = install scripts
(v) = vagrant file / chef recipe

Software that gets installed:
-----------------------------
(i) VirtualBox
(i) Ruby
(i) Ruby DevKit
(i) GEMS: Vagrant, Bundler

(v) Mono, java, nginx, rabbitmq


TODO
====
Mono recipe isn't working properly.
