HomelessShelter
===============

Some scripts for building Mono build and deploy environments through Vagant (for Windows and Debian)
Windows install scripts are long and complex-- some NuGet magic might help?

Network Setup
-------------
The vagrantfile supplied uses Bridged networking
If you have problems with Bridged mode and DHCP ip addresses, it may be that the gateway is not correctly set.
To fix this:
``sudo route add -host [your gateway] eth1
sudo route add -net 0.0.0.0 netmask 0.0.0.0 gw [your gateway] dev eth1``

Work arounds for Vagrant box bugs:
-----------------------------------
If your box won't start, find the .vbox file (usually c:\Users\...\VirtualBox VMs\... under windows)
Change: 
    &lt;CPU count="2" hotplug="false"&gt; 
to: 
    &lt;CPU count="1" hotplug="false"&gt; 
And change: 
    &lt;HardwareVirtEx enabled="true" exclusive="false"/&gt; 
to: 
    &lt;HardwareVirtEx enabled="false" exclusive="false"/&gt; 

Generally, Guest-in-Guest isn't working well


Software that gets installed:
-----------------------------
On host, by install scripts:
* VirtualBox
* Ruby
* Ruby DevKit
* Vagrant gem
* Bundler gem

On Vagrant boxes, by Chef:
* Mono
* java (currently disabled)
* nginx
* rabbitmq (currently disabled)
* ohai
* git
* open-ssh

