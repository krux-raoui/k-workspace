## MacOS X
install_mac: 
	@make --directory ./requirements setup_mac
	@make --directory ./docker-stack install_mac
	@make --directory ./k8s-host install_mac

deploy_mac: 
	@make --directory ./docker-stack deploy_mac
	@make --directory ./k8s-host deploy

undeploy_mac: 
	@make --directory ./k8s-host undeploy
	@make --directory ./docker-stack undeploy_mac

uninstall_mac: 
	@make --directory ./k8s-host uninstall_mac
	@make --directory ./docker-stack uninstall_mac
 
up_mac: install_mac deploy_mac
down_mac: undeploy_mac
rm_mac: uninstall_mac

# TODO: implement other platforms

## Generic Linux

# deploy_lin: 
# 	@make --directory ./layers/requirements setup_lin
# 	@make --directory ./layers/docker-stack deploy_lin
# 	@make --directory ./layers/k8s-host deploy
## Win 

# deploy_win:
# 	echo "not implemented yet"