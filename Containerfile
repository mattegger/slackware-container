FROM docker.io/aclemons/slackware:15.0

COPY scripts /scripts
RUN mkdir -p /etc/sbotools
COPY config/sbotools.conf /etc/sbotools/sbotools.conf
COPY config/blacklist /etc/slackpkg/blacklist
WORKDIR /root

# manuall import slackware gpg key
RUN /bin/sh /scripts/import-slack-gpg.sh

# update Slackware, install additional packages
RUN /bin/sh /scripts/slack-update.sh
RUN /bin/sh /scripts/packages.sh

# Install sbotools
WORKDIR /work
RUN /bin/bash /scripts/install-sbotools.sh

# Install packages used in SlackBuilding
RUN sboinstall --batch sbo-create sbo-maintainer-tools
