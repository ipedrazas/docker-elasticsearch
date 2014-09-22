#
# ElasticSearch Dockerfile
#
#
# ES 1.3.1
# Plugins:
#	- Marvel
#	- Mapper-attachment
#	- BigDesk
#	- Inquisitor
#

FROM dockerfile/java:oracle-java7

MAINTAINER Ivan Pedrazas<ipedrazas@gmail.com>

# Install ElasticSearch.
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz && \
  tar xvzf elasticsearch-1.3.2.tar.gz && \
  rm -f elasticsearch-1.3.2.tar.gz && \
  mv /tmp/elasticsearch-1.3.2 /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

RUN mkdir -p /data/plugins
RUN mkdir -p /data/work
RUN mkdir -p /data/data
RUN mkdir -p /data/log

# Install Marvel
RUN  /elasticsearch/bin/plugin --install elasticsearch/marvel/latest

# Install mapper-attachement
RUN /elasticsearch/bin/plugin --install elasticsearch/elasticsearch-mapper-attachments/2.0.0

# Install BigDesk
RUN /elasticsearch/bin/plugin --install lukas-vlcek/bigdesk

# Install Inquisitor
RUN /elasticsearch/bin/plugin --install polyfractal/elasticsearch-inquisitor

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200
EXPOSE 9300

