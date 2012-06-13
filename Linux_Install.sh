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
vagrant box add 'precise' "http://files.vagrantup.com/precise32.box"

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
	git clone https://github.com/opscode-cookbooks/nginx.git
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

cd ..

echo "Done!"
