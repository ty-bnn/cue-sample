package cuesample

import (
  "github.com/ty-bnn/cue-sample/cue-pkg/pkg"
)

deployment: pkg.#Deployment & {
  spec: template: spec: containers: [
    { image:  "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3" }
  ]
}