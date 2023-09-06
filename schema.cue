package cuesample

import (
	apps_v1 "k8s.io/api/apps/v1"
)

#Config: {
	id: string
	replicas: int & >= 2 & <= 4
	imageName: =~"^hyasuhisa"
	containerPort: int
}

#Deployment: apps_v1.#Deployment & {
	_config: #Config
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      _config.id
		namespace: "default"
	}
	spec: {
		replicas: _config.replicas
		revisionHistoryLimit: 3
		selector: matchLabels: app: _config.id
		template: {
			metadata: labels: app: _config.id
			spec: containers: [{
				image: _config.imageName
				name:  _config.id
				ports: [{
					containerPort: _config.containerPort
				}]
			}]
		}
	}
}