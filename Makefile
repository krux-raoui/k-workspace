

setup-macos:
	@make --directory ./src/0.prereqs/ deploy_macos

unsetup-macos:
	@make --directory ./src/0.prereqs/ undeploy_macos

deploy: 	
	@make --directory ./src/1.cluster/ deploy	
 
undeploy: 
	@make --directory ./src/1.cluster/ undeploy
	
	
	
	
