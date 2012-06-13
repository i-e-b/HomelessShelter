
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
function need($name) { return (-not (Test-Path $name)) }

pushd "$script_dir\..\..\Chef"

if (need "java") { git clone https://github.com/opscode-cookbooks/java.git }
if (need "rabbitmq") {git clone https://github.com/opscode-cookbooks/rabbitmq.git }
if (need "nginx") { git clone https://github.com/opscode-cookbooks/nginx.git }
if (need "mono") { git clone https://github.com/i-e-b/mono.git }
if (need "ohai") { git clone https://github.com/opscode-cookbooks/ohai.git }
if (need "git") { git clone https://github.com/opscode-cookbooks/git.git }
if (need "openssh") { git clone https://github.com/opscode-cookbooks/openssh.git }
if (need "jester-recipes") { git clone git@gitorious.7digital.local:sevendigital-jester/jester-recipes.git }
if (need "supervisor-recipe") { git clone https://github.com/i-e-b/supervisor-recipe.git }

popd
