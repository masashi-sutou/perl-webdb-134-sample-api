FROM perl:5.36.0-slim-bullseye

RUN apt-get update  \
    && apt-get install -y --no-install-recommends build-essential default-libmysqlclient-dev openssl libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#-- /opt/mods/localに依存cpan modulesをインストールする。
RUN mkdir -p /opt/mods
COPY cpanfile /opt/mods/
COPY cpanfile.snapshot /opt/mods/
WORKDIR /opt/mods

RUN cpanm -n Carton::Snapshot
RUN cpm install --show-build-log-on-failure
ENV PATH $PATH:/opt/mods/local/bin
ENV TZ=Asia/Tokyo

RUN mkdir -p /opt/app
WORKDIR /opt/app
