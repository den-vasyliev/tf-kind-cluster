provider "kind" {
  provider   = "docker"
  kubeconfig = pathexpand("${path.module}/kind-config")
}

resource "kind_cluster" "this" {
  name = "kind-cluster"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
          image: kindest/node:v1.29.0@sha256:eaa1450915475849a73a9227b8f201df25e55e268e5d619312131292e324d570
        - role: worker
          image: kindest/node:v1.29.0@sha256:eaa1450915475849a73a9227b8f201df25e55e268e5d619312131292e324d570
    EOF
}
