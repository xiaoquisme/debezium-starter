FROM apache/kafka:3.7.0
RUN sed -i 's/exec \/opt\/kafka\/bin\/kafka-server-start.sh/exec \/opt\/kafka\/bin\/kafka-server-start.sh -daemon/' /etc/kafka/docker/launch 
WORKDIR /opt/kafka
COPY ./Debezium-MySQL-plugin/debezium-connector-mysql/*.jar ./libs/
COPY user-connector.json ./config/
RUN echo "plugin.path=/opt/kafka/libs" >> /opt/kafka/config/connect-standalone.properties
ENTRYPOINT [ "/bin/bash", "-c", "/etc/kafka/docker/run && /opt/kafka/bin/connect-standalone.sh /opt/kafka/config/connect-standalone.properties /opt/kafka/config/user-connector.json"]