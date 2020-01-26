build:  Dockerfile
	@docker build -t machine-learning-tf .
	@docker tag machine-learning-tf:latest tkemmerling/machine-learning-tf:latest

clean:
	@docker rmi -f tkemmerling/machine-learning-tf:latest
	@docker rmi -f machine-learning-tf:latest















