#!/bin/bash

PIP=${PIP:-'pip==8.1.2'}
SETUPTOOLS=${SETUPTOOLS:-'setuptools==21.0.0'}

###
echo Running on:
cat /etc/lsb-release
echo 
echo Checking against:
echo pip: ${PIP}
echo setuptools: ${SETUPTOOLS}
echo

###
echo 'Get system up to date and installing system distributions'
apt-get update 1>&2  # > /dev/null 2>&1
apt-get install -y python-pip python-six 1>&2 # > /dev/null 2>&1

###
echo 'Updating pip&setuptools to actual versions (with bug)'
pip2 install -U "$PIP" "$SETUPTOOLS" 1>&2  #> /dev/null 2>&1
hash -r # cleanup bash caches 

pip2 --version
GOOD_VERSION=`pip2 --version`

###
echo 'Installing supersimple package in develop mode'
python2 setup.py develop -q --user

pip2 --version

CHECK_VERSION=`pip2 --version`
[[ "${CHECK_VERSION}" == "${GOOD_VERSION}" ]] && echo 'Gratz! You `setuptools-shadowbug` is fixed' && exit 0

echo "^^^^^^^^^  realy not equals to ${GOOD_VERSION}"
echo 'pip was downgraded and we are broken now :('
exit 1

###
# Extra checks showing that with this bug you could not upgrade pip (that's extremely annoying on older installation where you stuck with pip 1.5.4)
echo 'And we could not upgrade it back:'
pip2 install -U $PIP
pip2 --version
echo

echo 'And even using --user'
pip2 install -U $PIP --user
pip2 --version

