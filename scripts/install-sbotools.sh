#!/bin/sh

# Install sbotools

# download Slackbuild from SBo
wget https://slackbuilds.org/slackbuilds/15.0/system/sbotools.tar.gz
tar --strip-components=1 -zxvf sbotools.tar.gz
rm sbotools.tar.gz

# download source
grep DOWNLOAD= sbotools.info | cut -d \" -f 2 | wget -qi -

# run the SlackBuild
/bin/bash sbotools.SlackBuild

# install the package
installpkg /tmp/sbotools*.tgz

# clean up work files
rm /work/*
rm /tmp/sbotools*.tgz

# import SBo gpg key
gpg2 --keyserver hkp://keyserver.ubuntu.com \
     --recv-keys 720E73097A7E6E5577ECAB9C3F617144D7238786

# clone SBo tree
sbosnap fetch

# reinstall sbotools using sbotools, delete temp files and logs
sboinstall --reinstall --batch sbotools
rm -rf /tmp/SBo /root/sbo_logs/*
