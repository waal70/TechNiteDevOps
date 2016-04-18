VAGRANTFILE_API_VERSION = "2" 

project_name = "TechNiteDevOps"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
	config.vm.box = "dev-awaal" 
	config.vm.network "forwarded_port", guest: 80, host:3000, protocol: "tcp"
	
	config.vm.provider "virtualbox" do |v| 
		v.customize ["modifyvm", :id, "--cpus", "2"] 
		v.customize ["modifyvm", :id, "--memory", "4096"] 
	end 
	
	config.vm.provision "shell", path: "install-puppet-modules.sh" 
	
	config.vm.provision :puppet do |puppet| 
	  puppet.environment_path     = "environments"
	  puppet.environment          = "development"
	  puppet.manifests_path       = "manifests"
      puppet.manifest_file        = "site.pp"
	  #bogus-line logfile
	end 
end 