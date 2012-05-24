
$script_dir = Split-Path -parent $MyInvocation.MyCommand.Definition
$ruby_devkit_url = "https://github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe"
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
    if (-not (isItThere("rake")))  {
		if (-not (isItThere("ruby")))  {
			echo "Downloading Ruby"
			$file = ".\ruby_installer.exe"
			download($ruby_base_url, $file)
			echo "Running installer"
			$install = $file + " /silent"
			cmd /c $install
			del $file
			$env:Path += ";C:\Ruby193\bin"
			[System.Environment]::SetEnvironmentVariable("PATH", $env:Path, "User")
		}
        # try again
        echo "Checking for Rake"
        cmd /c "gem install --remote rake" | out-null
        if ($LASTEXITCODE -ne 0) {
            throw "failed to install rake"
        }
    }
} catch {
    Write-Error "Could not install Rake.`r`n`r`nThis may be due to non-administrator account permissions or network problems."
    exit 1
}

