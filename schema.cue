package cuesample

import (
	apps_v1 "k8s.io/api/apps/v1"
)

#Config: {
	id: string
	imageName: string
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
		replicas:             2
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