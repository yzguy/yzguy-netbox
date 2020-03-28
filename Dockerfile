FROM ubuntu:18.04 AS builder

ADD https://github.com/netbox-community/netbox/archive/v2.7.11.tar.gz /tmp
WORKDIR /tmp
RUN tar -xzvf /tmp/v2.7.11.tar.gz 
RUN ls /tmp

FROM ubuntu:18.04

RUN apt update && apt install -y python3 python3-pip python3-venv python3-dev \
    build-essential libxml2-dev libxslt1-dev libffi-dev libpq-dev libssl-dev zlib1g-dev \
    git

COPY --from=builder /tmp/netbox-2.7.11 /opt/netbox-2.7.11

RUN ln -s /opt/netbox-2.7.11 /opt/netbox

RUN adduser --system --group netbox && chown -R netbox /opt/netbox/netbox/media

RUN pip3 install -r /opt/netbox/requirements.txt && pip3 install napalm
