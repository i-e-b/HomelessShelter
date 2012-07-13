#!/bin/bash
echo "Checking for Ruby..."
sudo apt-get install ruby1.9.3 -y

if ! gem list -i vagrant ; then
	echo "Installing vagrant..." 
	sudo gem install vagrant -y
fi

if ! gem list -i bundler ; then 
	echo "Installing bundler..." 
	sudo gem install bundler -y
fi

echo "Checking for Virtualbox..."
sudo apt-get install virtualbox -y

echo "Adding vagrant box..."
# https://s3-eu-west-1.amazonaws.com/rosstimson-vagrant-boxes/debian-squeeze-64-rvm.box
# http://dl.dropbox.com/u/937870/VMs/squeeze64.box
# http://puppetlabs.s3.amazonaws.com/pub/squeeze64.box
# http://dl.dropbox.com/u/174733/debian-squeeze-64.box
# http://files.vagrantup.com/precise32.box

BOX="http://dl.dropbox.com/u/937870/VMs/squeeze64.box"
vagrant box add 'basebox' "$BOX"

echo "Cloning chef recipies..."
if [ ! -d "Chef" ]; then 
	mkdir Chef
fi

cd Chef

if [ ! -d "java" ]; then 
	git clone https://github.com/opscode-cookbooks/java.git
fi

if [ ! -d "rabbitmq" ]; then 
	git clone https://github.com/opscode-cookbooks/rabbitmq.git
fi

if [ ! -d "nginx" ]; then 
	git clone https://github.com/i-e-b/nginx.git
fi

if [ ! -d "mono" ]; then 
	git clone https://github.com/i-e-b/mono.git
fi

if [ ! -d "ohai" ]; then 
	git clone https://github.com/opscode-cookbooks/ohai.git
fi

if [ ! -d "git" ]; then 
	git clone https://github.com/opscode-cookbooks/git.git
fi

if [ ! -d "openssh" ]; then 
	git clone https://github.com/opscode-cookbooks/openssh.git
fi

if [ ! -d "jester-recipes" ]; then
	git clone git@gitorious.7digital.local:sevendigital-jester/jester-recipes.git
fi

if [ ! -d "supervisor-recipe" ]; then
	git clone https://github.com/i-e-b/supervisor-recipe.git
fi

if [ ! -d "7digital-recipes" ]; then
	git clone https://github.com/7digital/chef-recipes.git 7digital-recipes
fi


cd ..

echo "Done!"
