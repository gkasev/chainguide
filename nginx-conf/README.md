# NGINX configurations

In order for Solr to be protected - not every endpoint of Solr's API should be exposed to the public - it should be put behind a proxy. NGINX is a good option for that. Here's an example configuration for it: [configure nginx to proxy solr](https://github.com/samsk/solr-utils/tree/master/lua).
