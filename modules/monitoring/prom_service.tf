resource "kubernetes_service" "prometheus_service" {
  metadata {
    name = "prometheus"
    namespace = kubernetes_namespace.prometheus_ns.metadata[0].name
  }

  spec {
    selector = {
      app = "prometheus"
    }
    port {
      port        = 9090
      target_port = 9090
    }

    type = "NodePort"
  }
}

