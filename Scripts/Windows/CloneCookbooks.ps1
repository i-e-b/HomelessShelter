
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
function need($name) { return (-not (Test-Path $name)) }

pushd "$script_dir\..\..\Chef"

if (need "java") { git clone https://github.com/opscode-cookbooks/java.git }
if (need "rabbitmq") {git clone https://github.com/opscode-cookbooks/rabbitmq.git }
if (need "nginx") { git clone https://github.com/opscode-cookbooks/nginx.git }
if (need "mono") { git clone https://github.com/i-e-b/mono.git }

popd