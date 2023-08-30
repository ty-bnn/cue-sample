package cuesample

deployment: {
  apiVersion: "apps/v1"
  kind: "Deployment"
  metadata: {
    name: "cue-demo"
    namespace: "default"
  }
  spec: {
    replicas: 1
    revisionHistoryLimit: 3
    selector: matchLabels: app: "cue-demo"
    template: {
      metadata: labels: app: "cue-demo"
      spec: containers: [
        {
          image: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
          name: "cue-demo"
          ports: [
            {
              containerPort: 9090
            }
          ]
        }
      ]
    }
  }
}