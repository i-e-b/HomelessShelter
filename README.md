HomelessShelter
===============

Some scripts for building Mono build and deploy environments through Vagant (for Windows and Debian)
Windows install scripts are long and complex-- some NuGet magic might help?

Network Setup
-------------
The vagrantfile supplied uses NAT, Bridged and Host-Only mode.
To communicate from your host box, try ``ssh 192.168.10.100 -p 22 -l vagrant``

Work arounds for Vagrant box bugs:
-----------------------------------
If your box won't start, find the *.vbox file (usually c:\Users\...\VirtualBox VMs\... under windows)
Change: 
    <CPU count="2" hotplug="false"> 
to: 
    <CPU count="1" hotplug="false"> 
And change: 
    <HardwareVirtEx enabled="true" exclusive="false"/> 
to: 
    <HardwareVirtEx enabled="false" exclusive="false"/> 

Generally, Guest-in-Guest isn't working well


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

