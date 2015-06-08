
write-host "Installing .NET Framework 4.5.2"

if( (C:\vagrant\scripts\is-step-done.ps1 "install-remote-tools"))
{
	return;
}
C:\vagrant\resources\rtools_setup_x64.exe /q /norestart
write-host "Done!"