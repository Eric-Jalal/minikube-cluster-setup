resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx"
    namespace = kubernetes_namespace.nginx_ns.metadata[0].name
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 30080
    }

    type = "NodePort"
  }
}

