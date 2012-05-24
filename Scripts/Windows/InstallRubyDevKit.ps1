
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
$ruby_devkit_url = "https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe"

function download ($url, $file) {(new-object Net.WebClient).DownloadFile($url, $file)}


