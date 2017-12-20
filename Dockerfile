FROM node:9.3.0

ARG CLOUD_SDK_VERSION=161.0.0

EXPOSE 9001

RUN apt-get -qqy update && apt-get install -qqy \
  curl \
  gcc \
  git \
  python-dev \
  python-setuptools \
  apt-transport-https \
  && export CLOUD_SDK_REPO="cloud-sdk-jessie" \
  && echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && apt-get update \
  && apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 google-cloud-sdk-app-engine-java