LICENSE?="license key"

install-kustomize:
	go get sigs.k8s.io/kustomize

build-valence: install-kustomize
	kustomize build ./manifests > valence.yaml

valence: build-valence
	sed -i 's/"license key"/"$(LICENSE)"/g' ./valence.yaml

example-workloads: install-kustomize
	kustomize build ./example > example-workloads.yaml

tooling: install-kustomize
	cp ./tooling/kustomization.base.yaml ./tooling/kustomization.yaml
	kustomize build ./tooling > tooling.yaml

tooling-no-ms: install-kustomize
	sed 's/- .\/metrics-server//g' ./tooling/kustomization.base.yaml > ./tooling/kustomization.yaml
	kustomize build ./tooling > tooling.yaml
	