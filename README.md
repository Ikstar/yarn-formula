# yarn

This formula installs [yarn](https://yarnpkg.com/en/).

## Installing from PPA

An example pillar for installing from Debian based PPA repository:

    node:
      version: 0.2.1
      install_from_ppa: True
      ppa:
        repository_url: https://dl.yarnpkg.com/debian/
