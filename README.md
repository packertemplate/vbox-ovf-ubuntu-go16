# vbox-ovf-ubuntu-go16

This projects is a helper to fast creation of boxes using packer and store them in atlas.

This build will be local, and we will be using `virtualbox-ovf` builder.

This project will create vagrant boxes ready to run go16.

## Pre Requirements
1. Have ATLAS_TOKEN set

## How to use this repo

- git clone <this repo> <project name>


- Edit Makefile

```Makefile
#atlas username or atlas organization to upload the boxes
username = alvaro
# ie sufix = -project
sufix = -go16
```

- Update /scripts/provision.sh

## First run

On first run, it will download ubuntu base images from canonical, and will use those images as base.

## Build

You can build all the boxes listed with `make list` or one in particular as `make name.box`

```
make list
precise.box trusty.box vivid.box wily.box
make precise.box
make
```

