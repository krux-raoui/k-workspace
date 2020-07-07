USER_CONFIG?=./configs/temp.yaml
# USER_CONFIG?=./configs/example.yaml #run
VERBOSITY?="-v"
# VERBOSITY="-vvv" # Debug mode
#BECOME_ARGS?="-v"
BECOME_ARGS?="--ask-become-pass" # RUN 
 
install: 
	@ansible-playbook  ./src/playbook/install.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" $(BECOME_ARGS) 

deploy:	
	@ansible-playbook ./src/playbook/deploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}"  $(BECOME_ARGS)

undeploy:
	@ansible-playbook ./src/playbook/undeploy.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" $(BECOME_ARGS)
	
uninstall: 
	@ansible-playbook ./src/playbook/uninstall.yaml $(VERBOSITY) --extra-vars "@${USER_CONFIG}" $(BECOME_ARGS)

# Meta-commands
up:
	@ansible-playbook ./src/playbook/up.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" $(BECOME_ARGS)

down: 
	@ansible-playbook ./src/playbook/down.yaml $(VERBOSITY)  --extra-vars "@${USER_CONFIG}" $(BECOME_ARGS)
