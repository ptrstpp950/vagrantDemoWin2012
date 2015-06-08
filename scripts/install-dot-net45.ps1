
write-host "Installing .NET Framework 4.5.2"

if( (C:\vagrant\scripts\is-step-done.ps1 "install-dot-net-452"))
{
	return;
}
C:\vagrant\resources\NDP452-KB2901907-x86-x64-AllOS-ENU.exe /q /norestart
write-host "Done!"