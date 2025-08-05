FROM docker.io/aclemons/slackware:15.0

COPY scripts /scripts
RUN mkdir -p /etc/sbotools
COPY config/sbotools.conf /etc/sbotools/sbotools.conf
COPY config/blacklist /etc/slackpkg/blacklist
WORKDIR /root
RUN /bin/sh /scripts/import-slack-gpg.sh
# update Slackware, install additional packages
RUN /bin/sh /scripts/slack-update.sh
#RUN slackpkg -default_answer=yes -batch=on update gpg
#RUN slackpkg -default_answer=yes -batch=on update
#RUN slackpkg -default_answer=yes -batch=on install-new
#RUN slackpkg -default_answer=yes -batch=on upgrade-all
#RUN slackpkg -default_answer=yes -batch=on clean-system

#RUN slackpkg -default_answer=yes -batch=on update gpg && \
#    slackpkg -default_answer=yes -batch=on update
#
#RUN slackpkg -default_answer=yes -batch=on install a
#RUN slackpkg -default_answer=yes -batch=on install ap
#RUN slackpkg -default_answer=yes -batch=on install d
##RUN slackpkg -default_answer=yes -batch=on install e
##RUN slackpkg -default_answer=yes -batch=on install f
#RUN slackpkg -default_answer=yes -batch=on install k
##RUN slackpkg -default_answer=yes -batch=on install kde
#RUN slackpkg -default_answer=yes -batch=on install l
#RUN slackpkg -default_answer=yes -batch=on install n
##RUN slackpkg -default_answer=yes -batch=on install t
#RUN slackpkg -default_answer=yes -batch=on install tcl
##RUN slackpkg -default_answer=yes -batch=on install x
##RUN slackpkg -default_answer=yes -batch=on install xap
##RUN slackpkg -default_answer=yes -batch=on install y

# Install sbotools
#WORKDIR /work
#RUN /bin/bash /scripts/install-sbotools.sh
#RUN gpg2 --keyserver hkp://keys.openpgp.org \
#         --recv-keys 720E73097A7E6E5577ECAB9C3F617144D7238786
#RUN sbosnap fetch
#RUN sboinstall --reinstall --batch sbotools
#RUN rm -rf /tmp/SBo /root/sbo_logs/*

# Install packages used in SlackBuilding
#RUN sboinstall --batch sbo-create sbo-maintainer-tools
