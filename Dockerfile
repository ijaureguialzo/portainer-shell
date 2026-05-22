ARG KUBECTL_SHELL_VERSION=latest

FROM portainer/kubectl-shell:${KUBECTL_SHELL_VERSION}

COPY --chmod=755 first-namespace /usr/local/bin

ARG KUBECTL_SHELL_VERSION=latest
ENV KUBECTL_SHELL_VERSION=${KUBECTL_SHELL_VERSION}

RUN echo 'alias kubectl="kubectl -n $(first-namespace)"' >> /home/shell/.bashrc
RUN echo "PS1='kubernetes:\w\$\040'" >> /home/shell/.bashrc
