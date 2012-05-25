
$boxes = @(vagrant box list)
if (($boxes -match 'precise') -eq 'precise') {
	echo "Already have a box named 'precise'"
	exit 0
}

vagrant box add 'precise' "http://files.vagrantup.com/precise32.box"