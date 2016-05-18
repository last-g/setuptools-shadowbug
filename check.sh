#!/bin/bash

DIR='shadowbug'
TAG=${TAG-trusty}

docker run -i --rm --env "SETUPTOOLS=${SETUPTOOLS}" --env "PIP=${PIP}" -v "`pwd`:/tmp/${DIR}" "ubuntu:${TAG}" sh -c  "cp -R '/tmp/${DIR}' '/${DIR}' && cd '/${DIR}' && bash bug.sh 2>/dev/null"
