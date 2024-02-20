resource "kubernetes_service" "grafana_service" {
  metadata {
    name = "grafana"
    namespace = kubernetes_namespace.grafana_ns.metadata[0].name
  }

  spec {
    selector = {
      app = "grafana"
    }
    port {
      port        = 3000
      target_port = 3000
      node_port   = 3000
    }

    type = "NodePort"
  }
}

