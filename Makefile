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
    --tag $$IMAGE:$$TAG \
    --tag $$IMAGE:latest \
    .

push:
	@docker push $$IMAGE:$$TAG
	@docker push $$IMAGE:latest

settings:
	@./update-settings $$URL "$(file <.token)" "$$IMAGE:$$TAG"
