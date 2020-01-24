build:  Dockerfile
	@docker rmi -f tkemmerling/machine-learning-tf:latest
	@docker rmi -f machine-learning-tf:latest
	@docker rmi -f tkemmerling/machine-learning-tf-processing:latest
	@docker rmi -f machine-learning-tf-processing:latest
	@/bin/rm -rf build
	@/bin/mkdir build
	@/bin/cp Dockerfile build
	@docker build --no-cache -t machine-learning-tf .
	@/bin/rm -rf build
	@docker tag machine-learning-tf:latest tkemmerling/machine-learning-tf:latest
	@docker push tkemmerling/machine-learning-tf:latest

default:	build
	@echo "DONE"













