resource "kubernetes_namespace" "prometheus_ns" {
  metadata {
    name = "prometheus"
  }
}

resource "kubernetes_namespace" "grafana_ns" {
  metadata {
    name = "grafana"
  }
}

