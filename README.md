HomelessShelter
===============

Some scripts for building Mono build and deploy environments through Vagant (for Windows and Debian)
Windows install scripts are long and complex-- some NuGet magic might help?

Software that gets installed:
-----------------------------
On host, by install scripts:
*VirtualBox
*Ruby
*Ruby DevKit
*Vagrant gem
*Bundler gem

On Vagrant boxes, by Chef:
*Mono
*java
*nginx
*rabbitmq
*ohai
*git
*open-ssh


TODO
====
Mono recipe isn't working properly.
