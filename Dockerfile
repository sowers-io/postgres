FROM registry.developers.crunchydata.com/crunchydata/crunchy-postgres:ubi8-16.2-0

USER root
RUN microdnf update -y
RUN microdnf install -y curl gcc glibc-static openssl-libs openssl-devel
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN source $HOME/.cargo/env && cargo install pg-trunk
RUN source $HOME/.cargo/env && trunk install pgmq

USER 26