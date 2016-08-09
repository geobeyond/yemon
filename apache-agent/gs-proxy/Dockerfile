# Docker image for Apache + OpenAM HTTP agent 
FROM apache-agent-nightly

MAINTAINER warren.strange@forgerock.com

WORKDIR /opt

COPY agent.conf /opt/web_agents/apache24_agent/instances/agent_1/config/agent.conf

# set virtual host
WORKDIR /usr

RUN mkdir -p /usr/local/apache2/htdocs/geoserver.example.com

COPY geoserver.conf /usr/local/apache2/conf/extra/

RUN echo "include /usr/local/apache2/conf/extra/geoserver.conf" >> /usr/local/apache2/conf/httpd.conf

# EXPOSE 88
# Inherit CMD from Parent httpd:2.4 
# CMD ["httpd-foreground"]

