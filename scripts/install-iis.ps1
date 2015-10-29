write-host "Installing IIS 7.5; it will take a while..."

if( (C:\vagrant\scripts\is-step-done.ps1 "install-iis"))
{
	return;
}
Install-WindowsFeature -Name Web-Server -IncludeManagementTools 
Install-WindowsFeature Web-Asp-Net45
write-host "Done installing IIS."