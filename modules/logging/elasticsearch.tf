resource "kubernetes_deployment" "elasticsearch" {
  metadata {
    name      = "elasticsearch"
    namespace = kubernetes_namespace.elasticsearch_ns.metadata[0].name
    labels = {
      app = "elasticsearch"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "elasticsearch"
      }
    }

    template {
      metadata {
        labels = {
          app = "elasticsearch"
        }
      }

      spec {
        container {
          image = "docker.elastic.co/elasticsearch/elasticsearch:8.12.1"
          name  = "elasticsearch"

          port {
            container_port = 9200
          }

          env {
            name  = "discovery.type"
            value = "single-node"
          }
        }
      }
    }
  }
}

