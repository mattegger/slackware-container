FROM docker.io/aclemons/slackware:15.0

COPY scripts /scripts

# update Slackware, install additional packages
WORKDIR /root
COPY config/blacklist /etc/slackpkg/blacklist
RUN /bin/sh /scripts/slack-update.sh
RUN /bin/sh /scripts/packages.sh

# reinstall ca-certificates. don't know why this is necessary
RUN slackpkg -default_answer=yes -batch=on reinstall ca-certificates

# Install sbotools
WORKDIR /work
RUN mkdir -p /etc/sbotools
COPY config/sbotools.conf /etc/sbotools/sbotools.conf
RUN /bin/bash /scripts/install-sbotools.sh
RUN rm -rf /work

# Install packages used in SlackBuilding
RUN /bin/bash /scripts/install-qol-packages.sh
RUN /bin/bash /scripts/install-sbo-packaging.sh
