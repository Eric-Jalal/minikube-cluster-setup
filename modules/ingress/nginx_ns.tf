resource "kubernetes_namespace" "nginx_ns" {
  metadata {
    name = "nginx"
  }
}
