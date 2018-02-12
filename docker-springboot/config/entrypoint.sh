#!/bin/bash

## API HOME
HOME="/root"

## Repository directory
if [ -n "${PROJECT_NAME}" ]; then
    REPO_DIR=${HOME}/${PROJECT_NAME}
else
    echo -e "PROJECT_NAME is not defined, please create an environment variable. Read README to know how to do."
fi
REPO_DIR=${HOME}/${PROJECT_NAME}

cd ${REPO_DIR}
# Build JAR
mvn package
# Move JAR in HOME
chmod 775 ${REPO_DIR}/target/api-*.jar
mv ${REPO_DIR}/target/api-*.jar ${HOME}/api.jar

# Create log directory
mkdir -p ${REPO_DIR}/logs

# Run API
echo -e "Deploiment of ${ENVIRONMENT} environment"
cd ${HOME}
if [ -n "${ENVIRONMENT}" ]; then
    ## You can define a environment variable named ENVIRONMENT (prod, proto, dev...)
    java -jar -Dspring.profiles.active=${ENVIRONMENT} api.jar >> ${REPO_DIR}/logs/output-`date "+%m-%d-%Y"`.log
else
    java -jar api.jar >> ${REPO_DIR}/logs/output-`date "+%m-%d-%Y"`.log
fi

echo "/Entrypoint"