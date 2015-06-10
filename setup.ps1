mkdir -Force .\resources
pushd .\resources
if(!(Test-Path -Path .\NDP452-KB2901907-x86-x64-AllOS-ENU.exe )){
	curl http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe -OutFile NDP452-KB2901907-x86-x64-AllOS-ENU.exe
}
else{
	write-host ".NET 4.5 installer already exist"
}
if(!(Test-Path -Path .\rtools_setup_x64.exe )){
	curl http://download.microsoft.com/download/6/F/8/6F8AEDBF-E027-492A-9009-DB38788BBA02/rtools_setup_x64.exe -OutFile rtools_setup_x64.exe
}
else{
	write-host "rtools_setup_x64.exe already exist"
}
write-host "Resources downloaded, setup finished!"
popd