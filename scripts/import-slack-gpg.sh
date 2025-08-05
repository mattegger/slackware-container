#!/bin/sh

wget --no-check-certificate -O /tmp/gpgkey https://www.slackware.com/infra/keys/GPG-KEY
mkdir -p ~/.gnupg
#gpg --yes --batch --delete-key "$SLACKKEY" &>/dev/null
gpg --import /tmp/gpgkey &>/dev/null && \
echo -e "\t\t\tSlackware Linux Project's GPG key added"
