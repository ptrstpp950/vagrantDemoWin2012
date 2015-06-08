write-host "Installing IIS 7.5; it will take a while..."

if( (C:\vagrant\scripts\is-step-done.ps1 "install-iis"))
{
	return;
}

CMD /C START /w PKGMGR.EXE /l:log.etw /iu:IIS-WebServerRole
write-host "Done installing IIS."