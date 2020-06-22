CONFIG?=config.yaml
CONFIG_FILE="./${CONFIG}"

install_mac: 
	@ansible-playbook ./playbook/platforms/mac-x86_64/install.yaml -vvv --extra-vars "@${CONFIG_FILE}"

uninstall_mac: 
	@ansible-playbook ./playbook/platforms/mac-x86_64/uninstall.yaml -vvv --extra-vars "@${CONFIG_FILE}"



deploy:	
	@ansible-playbook ./playbook/deploy.yaml -vvv --extra-vars "@${CONFIG_FILE}"

undeploy:
	@ansible-playbook ./playbook/undeploy.yaml -vvv --extra-vars "@${CONFIG_FILE}"

 