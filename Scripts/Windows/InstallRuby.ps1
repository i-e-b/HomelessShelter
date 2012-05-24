
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
$ruby_base_url = "http://rubyforge.org/frs/download.php/76054/rubyinstaller-1.9.3-p194.exe"

function download ($url, $file) {(new-object Net.WebClient).DownloadFile($url, $file)}
function isItThere($cmd) { # hack to work around bugs in ANSICON
	try {
		"$cmd --version" | iex | %{$isItTherevstr = $_}
		return $isItTherevstr -match "$cmd"
	} catch {
		return $false
	}
}

echo "Checking for ruby and rake"
try {
    if (-not (isItThere("ruby")))  {
		echo "Downloading Ruby"
		$file = ".\ruby_installer.exe"
		download -url $ruby_base_url -file $file
		echo "Running installer"
		$install = $file + " /silent"
		cmd /c $install
		del $file
		$env:Path += ";C:\Ruby193\bin"
		[System.Environment]::SetEnvironmentVariable("PATH", $env:Path, "User")
    }
} catch {
    Write-Error "Could not install Ruby.`r`n`r`nThis may be due to non-administrator account permissions or network problems."
    exit 1
}

