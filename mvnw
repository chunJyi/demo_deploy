#!/bin/sh
# Maven Wrapper script

set -e

MAVEN_HOME="${HOME}/.m2/wrapper/dists/apache-maven-3.9.6"
MAVEN_URL="https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.9.6/apache-maven-3.9.6-bin.zip"
WRAPPER_JAR="${HOME}/.m2/wrapper/dists/wrapper/maven-wrapper-3.2.0.jar"
WRAPPER_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar"

# Download Maven if not present
if [ ! -d "${MAVEN_HOME}" ]; then
    echo "Downloading Maven 3.9.6..."
    mkdir -p "${MAVEN_HOME}"
    if command -v curl > /dev/null 2>&1; then
        curl -sL "${MAVEN_URL}" | unzip -q -o - -d "${MAVEN_HOME}/.."
    elif command -v wget > /dev/null 2>&1; then
        wget -qO- "${MAVEN_URL}" | unzip -q -o - -d "${MAVEN_HOME}/.."
    else
        echo "Error: curl or wget is required"
        exit 1
    fi
    mv "${MAVEN_HOME}/../apache-maven-3.9.6"/* "${MAVEN_HOME}/"
fi

exec "${MAVEN_HOME}/bin/mvn" "$@"
