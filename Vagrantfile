# -*- mode: ruby -*-
# vi: set ft=ruby :


if ! File.exists?('./resources/NDP452-KB2901907-x86-x64-AllOS-ENU.exe')
  puts '.Net 4.5.2 installer could not be found!'
  puts "Please run: .\\setup.ps1"
  exit 1
end

Vagrant.configure(2) do |wwwsrv|
  
  	wwwsrv.vm.box = "w2012_wmf5"
  
	######################################################################
	## Ustawienie komunikacji z guest OS VM na WinRM (default jest SSH) ##
	######################################################################
	
	 wwwsrv.vm.communicator = "winrm"
	 wwwsrv.winrm.username = "Administrator"
	 wwwsrv.winrm.password = "Qazxsw4r4r"
	 wwwsrv.winrm.host = "localhost"
 
	##########################
	## Forwardowanie portów ##
	##########################
	
	 wwwsrv.vm.network :forwarded_port,  host: 5985, guest: 5985, id: "winrm", auto_correct:true
	 wwwsrv.vm.network :forwarded_port,  host: 2200, guest: 3389, id: "rdp", auto_correct:true 
	 wwwsrv.vm.network "forwarded_port", host: 8080, guest: 80
	 wwwsrv.vm.network "forwarded_port", host: 4443, guest: 443
	 wwwsrv.vm.network "forwarded_port", host: 9018, guest: 4018
	 
	##########################
	## Wywołanie skryptów   ##
	########################## 
  
	wwwsrv.vm.provision :shell, path: "scripts/install-iis.ps1"
	wwwsrv.vm.provision :shell, path: "scripts/enable-dot-net.ps1"
	wwwsrv.vm.provision :shell, path: "scripts/create-site.ps1"


	###########################
	## Współdzielenie plików ##
	###########################
	wwwsrv.vm.synced_folder "./site", "/site_data"
	wwwsrv.vm.synced_folder "D:/VagrantWindows/TestWebApp/TestWebApp", "/TestWebSite"

  
	wwwsrv.vm.provider "virtualbox" do |vb|
		# Display the VirtualBox GUI when booting the machine
		vb.gui = true
#
#   	# Customize the amount of memory on the VM:
#	   vb.memory = "1024"
	end
  
end
