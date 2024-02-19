module "elasticsearch" {
  source = "./modules/ingress"
}

module "fluentd" {
  source = "./modules/logging"
}

module "kibana" {
  source = "./modules/monitoring"
}

