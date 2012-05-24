
## IMPORTANT: the check for virtualbox isn't working -- needs to be fixed!


$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition

$version = "4.1.16"
$vbox_url = "http://download.virtualbox.org/virtualbox/$version/VirtualBox-$version-78094-Win.exe"

function download ($url, $file) {(new-object Net.WebClient).DownloadFile($url, $file)}
function isVBoxInstalled() { # hack to work around bugs in ANSICON
	try {
		"VBoxManage --version" | iex | %{$isVBoxInstalledVString = $_}
		return $isItTherevstr -like "$($version)*"
	} catch {
		return $false
	}
}

if (isVBoxInstalled) {
	echo "VirtualBox is already installed"
	#exit 0
}

download -url $vbox_url -file "$script_dir\vbox_installer.exe"
& "$script_dir\vbox_installer.exe -silent"