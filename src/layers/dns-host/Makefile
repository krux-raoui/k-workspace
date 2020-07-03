USER_CONFIG?=../../../configs/example.yaml
VERBOSITY?="-v"
# VERBOSITY="-vvv" # Debug mode
 
install: 
	@ansible-playbook ./playbook/install.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass

deploy:	
	@ansible-playbook ./playbook/deploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass

undeploy:
	@ansible-playbook ./playbook/undeploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass
	
uninstall: 
	@ansible-playbook ./playbook/uninstall.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" --ask-become-pass

# Meta-commands
up:
	@ansible-playbook ./playbook/up.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass

down: 
	@ansible-playbook ./playbook/down.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" --ask-become-pass
