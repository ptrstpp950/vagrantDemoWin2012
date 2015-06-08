$ErrorActionPreference = "Stop"
echo "Deleting the default IIS website..."

if( (C:\vagrant\scripts\is-step-done.ps1 "delete-default-website"))
{
	return;
}


 
import-module webadministration
Stop-WebSite 'Default Web Site'
Remove-Website 'Default Web Site'
 
echo "Default website deleted."