FROM tomcat:8-jre8

###############################################
# Modify Tomcat configuration for enabling CORS
RUN mkdir -p /tmp/tomcat/conf
ENV TOMCAT_TMP /tmp/tomcat/conf

COPY assets/web.xml.cors ${TOMCAT_TMP}

WORKDIR ${TOMCAT_TMP}
RUN cp web.xml.cors ${CATALINA_HOME}/conf/web.xml
#################################################

#################################################
# Download required war files
RUN mkdir -p /tmp/tomcat/download
ENV WARS_DOWNLOADED /tmp/tomcat/download
WORKDIR ${WARS_DOWNLOADED}

ENV GEOSERVER_VERSION=2.9.0

RUN curl -L -O http://sourceforge.net/projects/geoserver/files/GeoServer/$GEOSERVER_VERSION/geoserver-$GEOSERVER_VERSION-war.zip \
&& unzip -x -d ${WARS_DOWNLOADED} geoserver-$GEOSERVER_VERSION-war.zip

RUN ls -lart
#################################################

# Set the GEOSERVER_DATA_DIR
RUN mkdir -p /var/lib/geoserver/data
VOLUME /var/lib/geoserver/data
ENV GEOSERVER_DATA_DIR /var/lib/geoserver/data

# Set CATALINA_OPTS for debugging
ENV CATALINA_OPTS "-Xdebug -Xrunjdwp:transport=dt_socket,address=9999,server=y,suspend=n"

# Add the WAR artifact
WORKDIR ${CATALINA_HOME}
# ADD ./assets/download/geoserver.war ${CATALINA_HOME}/webapps
RUN cp ${WARS_DOWNLOADED}/geoserver.war ${CATALINA_HOME}/webapps

CMD ["catalina.sh", "run"]

# Expose the port for debugging
EXPOSE 9999