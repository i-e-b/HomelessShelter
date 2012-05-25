$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition

$version = "4.1.16"
$vbox_url = "http://download.virtualbox.org/virtualbox/$version/VirtualBox-$version-78094-Win.exe"

function download ($url, $file) {(new-object Net.WebClient).DownloadFile($url, $file)}
function isVBoxInstalled() { # hack to work around bugs in ANSICON
	$vboxInstall = ${env:ProgramFiles}, ${env:ProgramFiles(x86)} |
		%{ "$_\Oracle\VirtualBox"} |  ?{ Test-Path $_ } | select -First 1
	return $vboxInstall -ne $null
}

if (isVBoxInstalled) {
	echo "VirtualBox is already installed"
	exit 0
}

echo "Downloading VirtualBox"
download -url $vbox_url -file "$script_dir\vbox_installer.exe"
echo "Installing VirtualBox"
try {
	"$script_dir\vbox_installer.exe -silent" | iex
	while (-not (isVBoxInstalled)) {
		sleep 1
		Write-Host "." -NoNewLine
	}
	echo "VirtualBox installed"
} catch {
	throw $_
}
