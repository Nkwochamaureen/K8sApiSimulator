resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo"
  }
}

resource "kubernetes_deployment" "api" {
  metadata {
    name = "api-deployment"
    namespace = kubernetes_namespace.demo.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "api"
      }
    }
    template {
      metadata {
        labels = {
          app = "api"
        }
      }
      spec {
        container {
          image = "nkwocha1234/api:latest"
          name  = "api"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api" {
 metadata {
  name = "api-service"
  namespace = kubernetes_namespace.demo.metadata[0].name
}

  spec {
    selector = {
      app = "api"
    }
    port {
      port        = 80
      target_port = 5000
    }
    type = "NodePort"
  }
}
