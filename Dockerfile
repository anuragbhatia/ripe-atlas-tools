FROM alpine:latest

# Install dependencies
RUN apk add --no-cache py3-pip
RUN apk add --no-cache libressl-dev \
    musl-dev \
    libffi-dev \
    python3-dev gcc

# Install ripe.atlas.tools 
RUN pip3 install ripe.atlas.tools

# Cleanup
RUN apk del gcc
RUN rm -rf /root/.cache
