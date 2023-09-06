package cuesample

import (
  "github.com/ty-bnn/cue-sample/cue-pkg/pkg"
)

deployment: pkg.#Deployment & {
  _config: pkg.#Config & {
    id: "cue-admin-server"
	  imageName: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	  containerPort: 9090
  }
}