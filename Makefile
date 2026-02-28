#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info}
	@echo Opciones:
	@echo ----------------------
	@echo build
	@echo push
	@echo settings
	@echo ----------------------

_header:
	@echo -----------------------
	@echo Portainer kubectl-shell
	@echo -----------------------

build:
	@docker buildx build \
    --no-cache \
    --platform linux/amd64,linux/arm64 \
    --build-arg KUBECTL_SHELL_VERSION=$$KUBECTL_SHELL_VERSION \
    --tag widemos/kubectl-shell:$$TAG \
    --tag widemos/kubectl-shell:latest \
    .

push:
	@docker push widemos/kubectl-shell:$$TAG
	@docker push widemos/kubectl-shell:latest

settings:
	@./update-settings $$URL "$(file <.token)" "widemos/kubectl-shell:$$TAG"
