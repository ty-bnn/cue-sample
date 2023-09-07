package cuesample

deployment: #Deployment & {
  _config: #Config & {
    id: "cue-admin-server"
    replicas: 1
	  imageName: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	  containerPort: 9090
  }
}