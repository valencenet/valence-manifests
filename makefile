install-kustomize:
	go get sigs.k8s.io/kustomize

valence:
	kustomize build ./manifests > valence.yaml

example-workloads:
	kustomize build ./example > example-workloads.yaml
