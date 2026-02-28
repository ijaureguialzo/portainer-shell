FROM portainer/kubectl-shell:latest

COPY --chmod=755 first-namespace /usr/local/bin

RUN echo 'alias kubectl="kubectl -n $(first-namespace)"' >> /home/shell/.bashrc
