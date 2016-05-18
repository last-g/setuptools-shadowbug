#!/bin/bash

###
echo 'Get system up to date and installing system distributions'
sudo apt-get update 1>&2  # > /dev/null 2>&1
sudo apt-get install -y python-pip 1>&2 # > /dev/null 2>&1

###
echo 'Updating pip&setuptools to actual versions (with bug)'
sudo pip2 install -U 'pip==8.1.2' 'setuptools==21.0.0' 1>&2  #> /dev/null 2>&1

pip2 --version

###
echo 'Installing supersimple package in develop mode'
python2 setup.py develop --user

pip --version

echo 'Yeah, we are broken now :('
echo 'And even could not upgrade'
sudo pip install -U pip
pip --version

echo 'And even using --user'
pip install -U pip --user
pip --version
