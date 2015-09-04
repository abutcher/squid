FROM fedora

MAINTAINER Andrew Butcher <abutcher@redhat.com>

EXPOSE 8080

RUN dnf -y install squid && dnf clean all

COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
