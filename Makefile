#!make

help: _header
	${info}
	@echo Opciones:
	@echo ----------------------
	@echo build
	@echo push
	@echo ----------------------

_header:
	@echo -----------------------
	@echo Portainer kubectl-shell
	@echo -----------------------

build:
	@docker buildx build --no-cache --platform linux/amd64,linux/arm64 --tag widemos/kubectl-shell .

push:
	@docker push widemos/kubectl-shell
