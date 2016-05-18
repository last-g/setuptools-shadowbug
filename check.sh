#!/bin/bash

docker run -i --rm -v `pwd`:/tmp/shadowbug 'ubuntu:trusty' sh -c  'cp -R /tmp/shadowbug /shadowbug && cd /shadowbug && bash bug.sh 2>/dev/null'
