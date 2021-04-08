FROM alpine:latest

# Install dependencies
RUN apk add --no-cache py3-pip
RUN apk add --no-cache libressl-dev \
    musl-dev \
    libffi-dev \
    python3-dev gcc

# No need to run build_rust which fails Docker Build
ARG CRYPTOGRAPHY_DONT_BUILD_RUST=1

# Install ripe.atlas.tools 
RUN pip3 install --upgrade pip && \
    pip3 install ripe.atlas.tools

# Cleanup
RUN apk del gcc
RUN rm -rf /root/.cache

# Ignore PyYAML Warnings
ENV PYTHONWARNINGS=ignore
