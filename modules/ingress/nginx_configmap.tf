resource "kubernetes_config_map" "nginx_config" {
  metadata {
    name      = "nginx-config"
    namespace = kubernetes_namespace.nginx_ns.metadata[0].name
  }

  data = {
    "nginx.conf" = <<-EOT
events {}
http {
  server {
    listen 80;

    location / {
      add_header Content-Type text/plain;
      add_header server_ip $pod_ip;
      return 200 "$pod_ip";
    }
  }
}
EOT
  }
}

