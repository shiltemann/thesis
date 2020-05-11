#!/bin/bash

# for ssh keys
. ~/.keychain/$HOSTNAME-sh

cd /data/code/thesis/thesis

# update files
git pull github

# create the pdf
make thesis

# sycn with owncloud for Andrew
rsync -av --delete --exclude=".*\.swp" --rsh='ssh -i /home/saskia/.ssh/id_rsa -p 42 -v' . saskia@bioinf-galaxian:/home/saskia/thesis/

whoami
