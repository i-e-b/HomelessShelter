
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
$ruby_devkit_url = "https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe"

function download ($url, $file) {(new-object Net.WebClient).DownloadFile($url, $file)}

if (${env:path} -match ";(.*?Ruby.*?\\bin)") {
	$ruby_path = $matches[1]
	
	if (Test-Path ("$ruby_path\..\lib\ruby\site_ruby\devkit.rb")) {
		echo "Ruby dev tools already installed"
		exit 0
	}
} else {
	throw "Ruby not found"
}


$dk_dir = "$ruby_path\devkit"
download -url "$ruby_devkit_url" -file "$script_dir\devkit.7zip"
md "$dk_dir"
& "$script_dir\7-zip\7z.exe x '$script_dir\devkit.7zip' '-o$dk_dir' "

pushd "$dk_dir"
	ruby dk.rb init
	ruby dk.rb install
popd
