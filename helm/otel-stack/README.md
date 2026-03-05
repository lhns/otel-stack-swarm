# otel-stack Helm chart

This chart deploys the full stack in-cluster with one release:

- Kafka
- VictoriaLogs
- VictoriaMetrics
- VictoriaTraces
- Grafana
- Alertmanager
- Custom OTel workloads (`opentelemetry-collector`, `trace-processor`, exporter collectors)

Kafka is chart-managed via in-chart templates (Deployment/Service/PVC + hook-based topic provisioning), not via Bitnami chart dependency.

## Quick start

```bash
cd helm/otel-stack
helm dependency update
helm upgrade --install otel-stack . --namespace monitoring --create-namespace
```

## Important defaults

- `optionalComponents.kafkaCli.enabled=false`
- `otel.exporters.victoriametricsRecovery.enabled=false`
- `optionalComponents.grafanaRulerProxy.enabled=false`
- Kafka auto topic creation is disabled and chart provisioning creates:
  - `otlp_logs`
  - `otlp_metrics`
  - `otlp_meta_metrics`
  - `otlp_spans`

## Service naming

OTel config files use service DNS names from `values.yaml`:

- `kafka:9092`
- `victorialogs-server:9428`
- `victoriametrics-server:8428`
- `victoriatraces-server:10428`

If a dependency chart version renders different service names, adjust:

- `services.victorialogs.name`
- `services.victoriametrics.name`
- `services.victoriatraces.name`
- `backendEndpoints.*`

## Ingress

The chart renders Kubernetes `Ingress` resources (not Traefik CRDs) and defaults to:

- `global.ingressClassName=traefik`

Hosts are configured in `hosts.*`.
