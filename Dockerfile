FROM adoptopenjdk:8-jdk-hotspot-bionic
RUN apt-get update \
 && apt-get install -y \
    curl \
    git \
 && rm -rf /var/lib/apt/lists/*
ADD coverity_tool.tgz /tmp/coverity_tool.tgz
RUN tar zxvf /tmp/coverity_tool.tgz -C /opt \
    && rm /tmp/coverity_tool.tgz \
    && mv /opt/cov-analysis-linux64-* /opt/cov
ENV PATH="/opt/cov/bin:${PATH}"
RUN rm -rf /tmp/cov/*
RUN mkdir /workspace
RUN chmod 777 /workspace
WORKDIR /workspace