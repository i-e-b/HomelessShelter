
function MissingGem($name) {return ((gem list --local) -match "$name").Length -lt 1}

("vagrant", "bundler") | %{
	if (MissingGem($_)) {& "gem install $_"} else {echo "$_ already installed"}
}
