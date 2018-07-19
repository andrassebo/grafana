FROM ubuntu
MAINTAINER andras.sebo@gmail.com

WORKDIR /usr/src/

RUN apt-get update && \
    apt-get install -y libfontconfig1 wget && \
    apt-get clean

RUN wget --progress=bar:force https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.1_armhf.deb && \
    dpkg -i grafana_5.2.1_armhf.deb && \
    grafana-cli plugins install grafana-simple-json-datasource && \
    grafana-cli plugins install grafana-piechart-panel

CMD service grafana-server start && tail -f /var/log/grafana/grafana.log
