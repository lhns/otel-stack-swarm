kafka-topics.sh --create --config retention.ms=-1 --config retention.bytes=5000000000 --topic otlp_metrics --bootstrap-server kafka:9092
kafka-topics.sh --create --config retention.ms=-1 --config retention.bytes=5000000000 --topic otlp_meta_metrics --bootstrap-server kafka:9092
kafka-topics.sh --create --config retention.ms=-1 --config retention.bytes=5000000000 --topic otlp_logs --bootstrap-server kafka:9092
kafka-topics.sh --create --config retention.ms=-1 --config retention.bytes=5000000000 --topic otlp_spans --bootstrap-server kafka:9092
