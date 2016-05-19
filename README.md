# Demonstrates bug in setuptools

## Problem

Directories order will be changed after running `python setup.py develop`. This may break your python installation because default system package directory gets more priority than local ones with newer versions of packages.

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
