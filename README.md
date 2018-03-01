# partitionaccesspath

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with partitionaccesspath](#setup)
    * [What partitionaccesspath affects](#what-partitionaccesspath-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with partitionaccesspath](#beginning-with-partitionaccesspath)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

This module creates a partition and mounts it to an accesspath on Windows.


## Module Description

This module introduces a small defined type `partitionaccesspath`. It shrinks
an existing partition and then creates a new (raw or formatted) partition,
which gets mounted to an accesspath. It is only supported on Windows.



## Setup

### Setup Requirements

* partitionaccesspath makes use of Powershell, you'll need at least version
  4.0 installed in order to use this module. This is available from Windows
  2012 R2 and beyond.


### Beginning with partitionaccesspath

To create a new partition and mount it automatically:

```puppet
partitionaccesspath { 'Data':
  driveletter => 'D',
  size        => '3GB',
  accesspath  => 'C:\Storage\Data',
  filesystem  => 'ntfs',
}
```


## Reference

### Defined Types

* `partitionaccesspath`: Create a partition and mount it to an accesspath


## Parameters

#### `driveletter`

This is the driveletter of the partition that will be shrunk with `size`.

#### `size`

The desired size of the partition. The acceptable values for this parameter
are: Bytes, KB, MB, GB, or TB.

#### `accesspath`

The path on which the new partition needs to be mounted.

#### `filesystem`

Filesystem can either be 'raw', 'ntfs' or 'fat32'. After the new partition is
created, it will be formatted to the filesystem that is set in the manifest.  
If filesystem is omitted or set to raw (which is the default value), it will
skip this step and leave the partition as is - raw.


## Limitations

This module is tested on the following platforms:

* Windows 2012 R2
* Windows 2016

It is tested with Puppet EE only.
