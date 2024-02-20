resource "kubernetes_namespace" "elasticsearch_ns" {
  metadata {
    name = "elasticsearch"
  }
}

resource "kubernetes_namespace" "kibana_ns" {
  metadata {
    name = "kibana"
  }
}

resource "kubernetes_namespace" "fluentd_ns" {
  metadata {
    name = "fluentd"
  }
}
