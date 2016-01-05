# automateEverything
Puppet/vagrant automation

#Prerequisites
- Vagrant
- VirtualBox
- Git Bash
- Puppet enterprise installer (for ubuntu) within this folder

#Config
Edit the 4 files in the root folder changing hostname stubs and IP addresses to within your subnet.
- Vagrantfile
- agent.sh
- enterpriseAnswers.txt
- enterprise_install.sh

#Run the VMs and install
- Use Git Bash to change directory (cd) into this folder
- Run 'vagrant status' to ensure the syntax is correct and check the VM status
- Run 'vagrant up' to start the VM and begin installing puppet enterprise on the master.

#Maintenance
- vagrant status

These default to all machines, multiple machines can be specified optionally
- vagrant up (vm)
- vagrant halt (vm)
- vagrant destroy (vm)



