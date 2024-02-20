resource "kubernetes_deployment" "grafana_deployment" {
  metadata {
    name = "grafana"
    namespace = kubernetes_namespace.grafana_ns.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "grafana"
      }
    }
    template {
      metadata {
        labels = {
          app = "grafana"
        }
      }
      spec {
        container {
          name  = "grafana"
          image = "grafana/grafana:10.3.3"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

