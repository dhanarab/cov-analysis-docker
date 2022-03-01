FROM adoptopenjdk:8-jdk-hotspot-bionic
RUN apt-get update \
 && apt-get install -y \
    curl \
    git \
 && rm -rf /var/lib/apt/lists/*
COPY cov-analysis.tgz /tmp/cov-analysis.tgz
RUN tar zxvf /tmp/cov-analysis.tgz -C /opt \
    && rm /tmp/cov-analysis.tgz \
    && mv /opt/cov-analysis-linux64-* /opt/cov
ENV PATH="/opt/cov/bin:${PATH}"
RUN rm -rf /tmp/cov/*
RUN mkdir /workspace
RUN chmod 777 /workspace
WORKDIR /workspace