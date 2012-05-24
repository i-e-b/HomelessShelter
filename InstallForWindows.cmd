cd %~dp0

powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallRubyAndRake.ps1"
powershell.exe -NoProfile -ExecutionPolicy ByPass ".\Scripts\Windows\InstallRubyDevKit.ps1"
