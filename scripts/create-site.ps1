import-module webadministration


rm c:\Altamira -Force -Recurse
cp C:\vagrant\dist\ C:\Altamira -Force -Recurse


if(Test-Path IIS:\Sites\"Default Web Site"){
	Write-Host "Delete DefaultWebSite"
	Remove-Website -Name "Default Web Site"
	Write-Host "OK."
}
else
{
	Write-Host "Default Website already deleted"
}

if(Test-Path IIS:\AppPools\"DefaultAppPool"){
	Write-Host "Delete default AppPool"
	Remove-WebAppPool -Name "DefaultAppPool"
	Write-Host "OK."
}
else
{
	Write-Host "Default AppPool already deleted"
}


$directories = @("c:\Altamira\")

ForEach ($directory in $directories)
{
	Write-host "set acl for $directory"

	$inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
	$propagation = [system.security.accesscontrol.PropagationFlags]"None"
	$acl = Get-Acl $directory
	$accessrule = New-Object system.security.AccessControl.FileSystemAccessRule("IIS_IUSRS", "ReadAndExecute", $inherit, $propagation, "Allow")
	$acl.AddAccessRule($accessrule)
	set-acl -aclobject $acl $directory
}

if(Test-Path IIS:\AppPools\"NmB"){
	Write-Host "AppPool NmB already exists"
}
else
{
	Write-Host "Create new Application Pool called NmB"
	New-WebAppPool -Name "NmB"
	Set-ItemProperty IIS:\AppPools\NmB managedRuntimeVersion v4.0
	Write-Host "Done"
}

if(Test-Path IIS:\Sites\"NmB"){

	Write-Host "Site NmB already exists"
}
else
{
	Write-Host "Create new site called NmB"
	New-WebSite -Name NmB -Id 1 -Port 80 -PhysicalPath "c:\Altamira\" -ApplicationPool NmB
	New-ItemProperty "IIS:\Sites\NmB" -Name bindings -Value @{protocol="https";bindingInformation="*:443:"}	
	Write-Host "Done"
}