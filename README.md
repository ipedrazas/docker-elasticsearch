# ElasticSearch


ElasticSearch version: 1.3.1

Plugins installed:

* Marvel
* mapper-attachement
* BigDesk
* Inquisitor


Build the image

    docker build -t ipedrazas/es .

Run the image

    docker run -d -p 9200:9200 -p 9300:9300 ipedrazas/es

Mounting a volume:

    docker run -d -p 9200:9200 -p 9300:9300 --name es -v /data/elasticsearch:/data ipedrazas/es

    docker run -it --rm -p 9200:9200 -p 9300:9300 -v /data/elasticsearch:/data ipedrazas/es bash


Create an Index

    curl -XPUT 'http://localhost:9200/demo/'


Test install

    curl -XGET 'http://localhost:9200'
