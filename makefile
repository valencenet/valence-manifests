LICENSE?="license key"

install-kustomize:
	go get sigs.k8s.io/kustomize

build-valence: install-kustomize
	rm valence.yaml
	kustomize build ./manifests > valence.yaml

valence: build-valence
	sed -i 's/"license key"/"$(LICENSE)"/g' ./valence.yaml

example-workloads: install-kustomize
	rm example-workloads.yaml
	kustomize build ./example > example-workloads.yaml

tooling: install-kustomize
	rm tooling.yaml
	cp ./tooling/kustomization.base.yaml ./tooling/kustomization.yaml
	kustomize build ./tooling > tooling.yaml

tooling-no-ms: install-kustomize
	rm tooling.yaml
	sed 's/- .\/metrics-server//g' ./tooling/kustomization.base.yaml > ./tooling/kustomization.yaml
	kustomize build ./tooling > tooling.yaml
	