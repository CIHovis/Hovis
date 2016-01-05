Vagrant.configure(2) do |config|
	
	masterIP = "192.168.1.150"
	agent1IP = "192.168.1.151"
	agent2IP = "192.168.1.152"
	agent3IP = "192.168.1.153"
	masterHostname = "hmaster"
	agentHostnameStub = "hagent"
	domain   = ".netbuilder.private"
        CPUCores = 2
	masterRAM= 4568
	agentRAM = 2048
	

	masterFQDN = masterHostname + domain
	
	config.vm.provider :virtualbox do |masterVB|
		masterVB.memory = agentRAM
		masterVB.cpus = CPUCores
	end
	
	config.vm.box = "ubuntu/trusty64"

	config.vm.define "master" do |master|
		master.vm.hostname = masterFQDN
		master.vm.network "public_network", ip: masterIP
	
		master.vm.provision "puppetinstall",
			type: "shell",
			path: "enterprise_install.sh"

		master.vm.provider :virtualbox do |masterVB|
			masterVB.memory = masterRAM
			masterVB.cpus = CPUCores
		end
		master.vm.synced_folder "modules/", "/etc/puppetlabs/code/environments/production/modules"
		master.vm.synced_folder "environments/", "/etc/puppetlabs/code/environments"
	#	master.vm.synced_folder "modules/", "/etc/puppet/modules"
	#	master.vm.synced_folder "site_standalone/", "/etc/puppetlabs/manifests"
	#	master.vm.provision "puppet" do |puppet|
	#		puppet.manifests_path = "site_standalone"
   	#		puppet.manifest_file = "site.pp"
	#		puppet.module_path = "modules"
	#	end
		
	end
	
#	for i in 1..agentCount 
#		config.vm.define "agent" + i.to_s do |agent|
#			agent.vm.hostname = agentHostnameStub + i.to_s + ".netbuilder.private"
#			agent.vm.network "public_network"
#			
#			agent.vm.provision "agent",
#				type: "shell",
#				path: "agent.sh"
#		end
#	end

	config.vm.define "agent1" do |agent|
		agent.vm.hostname = agentHostnameStub + "1" + domain
		agent.vm.network "public_network", ip: agent1IP
		agent.vm.provision "agent",
			type: "shell",
			path: "agent.sh"
	end

	config.vm.define "agent2" do |agent|
		agent.vm.hostname = agentHostnameStub + "2" + domain
		agent.vm.network "public_network", ip: agent2IP
		agent.vm.provision "agent",
			type: "shell",
			path: "agent.sh"
	end

	config.vm.define "agent3" do |agent|
		agent.vm.hostname = agentHostnameStub + "3" + domain
		agent.vm.network "public_network", ip: agent3IP
		agent.vm.provision "agent",
			type: "shell",
			path: "agent.sh"
	end

end
