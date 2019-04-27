LICENSE?=license-key

install-kustomize:
	go get sigs.k8s.io/kustomize

build-valence:
	kustomize build ./manifests > valence.yaml

valence: build-valence
	sed -i 's/license-key/"$(LICENSE)"/g' ./valence.yaml

example-workloads:
	kustomize build ./example > example-workloads.yaml
