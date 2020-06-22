CONFIG?=config.yaml
CONFIG_FILE="./${CONFIG}"

install_mac: 
	@ansible-playbook ./playbook/platforms/mac-x86_64/install.yaml -vvv --extra-vars "@${CONFIG_FILE}"

deploy_mac: 
	@ansible-playbook ./playbook/platforms/mac-x86_64/deploy.yaml -vvv --extra-vars "@${CONFIG_FILE}"

undeploy_mac:
	@ansible-playbook ./playbook/platforms/mac-x86_64/undeploy.yaml -vvv --extra-vars "@${CONFIG_FILE}"

uninstall_mac:
	@ansible-playbook ./playbook/platforms/mac-x86_64/uninstall.yaml -vvv --extra-vars "@${CONFIG_FILE}"

up_mac: install_mac deploy_mac
down_mac: undeploy_mac
rm_mac: uninstall_mac



#TODO: Implements other platforms