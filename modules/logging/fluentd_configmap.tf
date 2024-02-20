resource "kubernetes_config_map" "fluentd_config" {
  metadata {
    name = "fluentd-config"
    namespace = kubernetes_namespace.fluentd_ns.metadata[0].name
  }

  data = {
    "fluent.conf" = <<EOF
<match **>
  @type elasticsearch
  host "elasticsearch"
  port 9200
  logstash_format true
  <buffer>
    @type memory
    flush_interval 5s
  </buffer>
</match>
EOF
  }
}

