$ErrorActionPreference = "Stop"

write-host "Enabling .NET Framework"
if( (C:\vagrant\scripts\is-step-done.ps1 "enable-dot-net"))
{
	return;
}

import-module servermanager
add-windowsfeature as-net-framework