#!/bin/bash

set -e



# Setup sudo to allow no-password sudo for "admin"
groupadd -r cfadmin
usermod -a -G cfadmin cfadmin
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=cfadmin' /etc/sudoers
sed -i -e 's/%cfadmin ALL=(ALL) ALL/%cfadmin ALL=NOPASSWD:ALL/g' /etc/sudoers
