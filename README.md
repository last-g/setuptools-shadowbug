# Demonstrates bug in setuptools

## Problem

Directories order will be changed after running `python setup.py develop`. This may break your python installation because default system package directory gets more priority than local ones with newer versions of packages.

The most typical symptom looks like:
```console
vagrant@vagrant-ubuntu-trusty-64:~$ # We want to update pip but it doesn't work realy
vagrant@vagrant-ubuntu-trusty-64:~$ sudo pip install -U pip==8.1.2
Downloading/unpacking pip==8.1.2
  Downloading pip-8.1.2-py2.py3-none-any.whl (1.2MB): 1.2MB downloaded
Installing collected packages: pip
  Found existing installation: pip 1.5.4
    Not uninstalling pip at /usr/lib/python2.7/dist-packages, owned by OS
Successfully installed pip
Cleaning up...
vagrant@vagrant-ubuntu-trusty-64:~$ hash -r
vagrant@vagrant-ubuntu-trusty-64:~$ pip --version
pip 1.5.4 from /usr/lib/python2.7/dist-packages (python 2.7)
vagrant@vagrant-ubuntu-trusty-64:~$ pip install -U pip --user
Downloading/unpacking pip from https://pypi.python.org/packages/9c/32/004ce0852e0a127f07f358b715015763273799bd798956fa930814b60f39/pip-8.1.2-py2.py3-none-any.whl#md5=0570520434c5b600d89ec95393b2650b
  Downloading pip-8.1.2-py2.py3-none-any.whl (1.2MB): 1.2MB downloaded
Installing collected packages: pip
Successfully installed pip
Cleaning up...
vagrant@vagrant-ubuntu-trusty-64:~$ hash -r
vagrant@vagrant-ubuntu-trusty-64:~$ pip --version
pip 1.5.4 from /usr/lib/python2.7/dist-packages (python 2.7)
vagrant@vagrant-ubuntu-trusty-64:~$ ~/.local/bin/pip --version
pip 1.5.4 from /usr/lib/python2.7/dist-packages (python 2.7)
```

### Checking for bug (by default on ubuntu trusty)
```bash
./check.sh
```

### Or check with specific version of ubuntu
```bash
TAG='xenial' ./check.sh
```

```bash
TAG='latest' ./check.sh
```

### Or even with specific version of setuptools
```bash
SETUPTOOLS='setuptools<20' ./check.sh
```

```bash
SETUPTOOLS='git+https://github.com/last-g/setuptools@bug/shadowbug' ./check.sh
```

## More in [bug.sh](bug.sh)
