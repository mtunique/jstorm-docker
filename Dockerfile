FROM ubuntu:trusty
MAINTAINER mtunique <oatgnem@gmail.com>


# environment variables
ARG JSTORM_VERSION=2.1.1
ARG JSTORM_FILE=jstorm-${JSTORM_VERSION}.zip
ARG JSTORM_URL=https://github.com/alibaba/jstorm/releases/download/${JSTORM_VERSION}/${JSTORM_FILE}
ARG JSTORM_INSTALL_PATH=/opt
ENV JSTORM_HOME $JSTORM_INSTALL_PATH/jstorm
ENV PATH $PATH:$JSTORM_HOME/bin

# Install requirements
RUN apt-get update && \
    apt-get install -y less openjdk-7-jre-headless unzip wget python && \
    mkdir -p "${JSTORM_INSTALL_PATH}" && \
    wget "$JSTORM_URL" -O "$JSTORM_INSTALL_PATH/$JSTORM_FILE" && \
    unzip "${JSTORM_INSTALL_PATH}/jstorm-${JSTORM_VERSION}.zip" -d "${JSTORM_INSTALL_PATH}" && \
    mv "${JSTORM_INSTALL_PATH}/jstorm-${JSTORM_VERSION}" "${JSTORM_HOME}" && \
    chmod +x "$JSTORM_HOME/bin/jstorm" && \
    rm "$JSTORM_INSTALL_PATH/$JSTORM_FILE"


# Install build dependencies and jstorm
# RUN set -x && \
#  wget -q "${JSTORM_URL}" | \
  # apk del .build-deps
  # $JSTORM_INSTALL_PATH/jstorm-${JSTORM_VERSION}.zip

WORKDIR $JSTORM_HOME

# USER $JSTORM_USER
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
