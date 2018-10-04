# Dockerfile for icinga2 client with support for additional nagios checks form https://github.com/anordby/plugins
# project on https://github.com/evermind/docker-icinga2-client

FROM debian:stretch

MAINTAINER Thomas Gruenert

RUN export DEBIAN_FRONTEND=noninteractive \ 
  && apt-get update \
  && apt-get install -y --no-install-recommends \
       curl \
       dnsutils \
       gnupg \
       locales \
       lsb-release \
       sudo \
       supervisor \
       unzip \
       wget

RUN export DEBIAN_FRONTEND=noninteractive \
 && curl -s https://packages.icinga.com/icinga.key \
 | apt-key add - \
 && echo "deb http://packages.icinga.org/debian icinga-$(lsb_release -cs) main" > /etc/apt/sources.list.d/icinga2.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      icinga2 \
      monitoring-plugins \
      nagios-nrpe-plugin \
      nagios-plugins-contrib \
      nagios-snmp-plugins \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


EXPOSE 5665

# Initialize and run Supervisor
ENTRYPOINT ["/opt/run"]

