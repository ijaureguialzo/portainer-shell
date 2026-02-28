ARG KUBECTL_SHELL_VERSION=latest

FROM portainer/kubectl-shell:${KUBECTL_SHELL_VERSION}

COPY --chmod=755 first-namespace /usr/local/bin

RUN echo 'alias kubectl="kubectl -n $(first-namespace)"' >> /home/shell/.bashrc
