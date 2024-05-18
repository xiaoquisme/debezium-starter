docker run --link kafka:kafka -d -p 8081:8080 \
-e KAFKA_CLUSTERS_0_NAME=local \
-e KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS='kafka:9092' \
-e KAFKA_BROKERCONNECT='kafka:9092' \
-e DYNAMIC_CONFIG_ENABLED=true \
provectuslabs/kafka-ui
