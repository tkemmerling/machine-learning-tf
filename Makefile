build:	
	@docker rmi -f tkemmerling/machine-learning-tf:latest
	@docker rmi -f machine-learning-tf:latest
	@/bin/rm -rf build
	@/bin/mkdir build
	@/bin/cp Dockerfile build
	@docker build -t machine-learning-tf .
	@/bin/rm -rf build
	@docker tag machine-learning-tf:latest tkemmerling/machine-learning-tf:latest
	@docker push tkemmerling/machine-learning-tf:latest

default:	build
	@echo "DONE"










