resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = "atlantis"
  }
}

resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://runatlantis.github.io/helm-charts"
  chart      = "atlantis"
  namespace  = kubernetes_namespace.atlantis.metadata[0].name

  # Basic GitHub configuration
  set {
    name  = "orgAllowlist"
    value = var.orgAllowlist
  }

  set {
    name  = "github.user"
    value = var.github_username
  }

  set_sensitive {
    name  = "github.token"
    value = var.github_token
  }
  
  set_sensitive {
    name  = "github.secret"
    value = var.webhook_secret
  }

   # AZS need fixing 
  values = [
    <<EOF
    volumeClaim:
      enabled: true
      dataStorage: 5Gi  
      storageClassName: "gp2" 
      accessModes: ["ReadWriteOnce"]

    service:
      type: LoadBalancer
      port: 80
      targetPort: 4141
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-type: nlb
        service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
        service.beta.kubernetes.io/aws-load-balancer-connection-idle-timeout: "60"
        service.beta.kubernetes.io/aws-load-balancer-subnets: "${var.public_subnet_id},${var.private_subnet_id}"
     

    ingress:
      enabled: false

    EOF
  ]

}


resource "helm_release" "ebs_csi_driver" {
  name       = "aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"
}


