#### Table of Contents

1. [Overview](#overview)
1. [Setup - The basics of getting started with nodejs](#setup)
1. [Usage](#usage)
1. [Limitations](#limitations)

## Overview

The nodejs module installs a global Node.js package and the npm package provider in
a directory of your choosing.

## Setup

### What nodejs affects:
* the Node.js package
* the npm package
* globally installed npm packages
* local npm packages installed in user-specified directories

## Usage

To install Node.js and npm in '/usr/local/bin':

include nodejs

If you wish to install in an alternate location:

class { 'nodejs':
   path => ${path},
}

If you wish to install an alternate version:

class { 'nodejs':
   version => 'v4.6.2',
}

## Limitations

This module has received limited testing on:

* CentOS/RHEL 6/7
* Ubuntu 14.04/15.10
