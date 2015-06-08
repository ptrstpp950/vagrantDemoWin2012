param ([string] $file)

$doneFile = "C:\tmp\"+$file+".done"

if(Test-Path $doneFile)
{
	write-host "skip: already done";
	return $true;
}
Set-Content -Value "1" -Path $doneFile

return $false;