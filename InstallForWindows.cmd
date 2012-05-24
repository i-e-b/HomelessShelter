cd %~dp0

powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallRuby.ps1"
powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallRubyDevKit.ps1"
powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallGems.ps1"
powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallVirtualBox.ps1"
