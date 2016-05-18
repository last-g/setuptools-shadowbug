# Demonstrates bug in setuptools

### Checking for bug (by default on ubuntu trusty)
```bash
./check.sh
```

### Or check with specific version of ubuntu
```bash
TAG='xenial' ./check.sh
```

### Or even with specific version of setuptools
```bash
SETUPTOOLS='setuptools<20' ./check.sh
```

## More in [bug.sh](bug.sh)
