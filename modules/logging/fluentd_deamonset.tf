resource "kubernetes_daemonset" "fluentd" {
  metadata {
    name = "fluentd"
    namespace = kubernetes_namespace.fluentd_ns.metadata[0].name
    labels = {
      k8s-app = "fluentd-logging"
    }
  }

  spec {
    selector {
      match_labels = {
        k8s-app = "fluentd-logging"
      }
    }

    template {
      metadata {
        labels = {
          k8s-app = "fluentd-logging"
        }
      }

      spec {
        container {
          image = "fluent/fluentd-kubernetes-daemonset:v1-debian-elasticsearch"
          name  = "fluentd"

          volume_mount {
            name       = "varlog"
            mount_path = "/var/log"
          }

          volume_mount {
            name       = "varlibdockercontainers"
            mount_path = "/var/lib/docker/containers"
            read_only  = true
          }
        }

        volume {
          name = "varlog"
          host_path {
            path = "/var/log"
          }
        }

        volume {
          name = "varlibdockercontainers"
          host_path {
            path = "/var/lib/docker/containers"
          }
        }
      }
    }
  }
}

