FROM hypriot/rpi-java:1.8.0

ARG SERVICE_ID

VOLUME /tmp

EXPOSE 8080

ADD http://a1.codemotion.atsistemas.com/repository/maven-releases/com/atsistemas/codemotion/indexed-service-generated-${SERVICE_ID}/1.0/indexed-service-generated-${SERVICE_ID}-1.0.jar /indexed-service.jar

ENV SERVICE_ID=${SERVICE_ID}

RUN bash -c 'touch /indexed-service.jar'

CMD java -Djava.security.egd=file:/dev/./urandom -Dspring.cloud.consul.host=$CONSUL_PORT_8500_TCP_ADDR -jar /indexed-service.jar
