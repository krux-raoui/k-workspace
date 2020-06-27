USER_CONFIG?=./configs/example.yaml
VERBOSITY?="-v"
# VERBOSITY="-vvv" # Debug mode
 
install: 
	@ansible-playbook ./src/playbook/install.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass

deploy:	
	@ansible-playbook ./src/playbook/deploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass

undeploy:
	@ansible-playbook ./src/playbook/undeploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass
	
uninstall: 
	@ansible-playbook ./src/playbook/uninstall.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass

# Meta-commands
up:
	@ansible-playbook ./src/playbook/up.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass

down: 
	@ansible-playbook ./src/playbook/down.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass
