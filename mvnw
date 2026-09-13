#!/bin/sh
# Maven Wrapper script

set -e

MAVEN_VERSION="3.9.6"
MAVEN_DIR="${HOME}/.m2/wrapper/dists/apache-maven-${MAVEN_VERSION}"
MAVEN_URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${MAVEN_VERSION}/apache-maven-${MAVEN_VERSION}-bin.zip"

# Download and extract Maven if not present
if [ ! -d "${MAVEN_DIR}" ]; then
    echo "Downloading Maven ${MAVEN_VERSION}..."
    mkdir -p "${HOME}/.m2/wrapper/dists"
    curl -sL "${MAVEN_URL}" | unzip -q -o - -d "${HOME}/.m2/wrapper/dists"
fi

exec "${MAVEN_DIR}/bin/mvn" "$@"
