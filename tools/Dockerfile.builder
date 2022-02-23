FROM alpine:3.15.0

ARG TRIVY_VERSION="0.23.0"

# Install build dependencies
RUN \
  apk --update-cache add --virtual build-dependencies curl && \
  mkdir -p /tmp/build

WORKDIR "/tmp/build"

# Install trivy
RUN \
  wget https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz && \
  tar -zxf trivy_${TRIVY_VERSION}_Linux-64bit.tar.gz && \
  mv trivy /usr/bin/trivy

WORKDIR /

# Remove build dependencies
RUN \
  apk del build-dependencies && \
  rm -rf /tmp/build


