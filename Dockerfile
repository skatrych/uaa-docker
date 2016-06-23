FROM davidcaste/alpine-tomcat:tomcat8
MAINTAINER Sergii Katrych

ENV UAA_CONFIG_PATH /uaa
ENV CATALINA_HOME /opt/tomcat

RUN rm -rf $CATALINA_HOME/webapps/*
ADD cloudfoundry-identity-uaa-3.4.0.war $CATALINA_HOME/webapps/ROOT.war

# Overwriting default UAA config file, that's built-in into the war file
ADD uaa.yml /uaa/uaa.yml

#VOLUME ["/uaa"]

EXPOSE 8080

CMD $CATALINA_HOME/bin/catalina.sh run
