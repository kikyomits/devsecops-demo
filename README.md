

```sh

# Install tekton
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml 

# Install tekton dashboard
kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml

# Install tekton triger
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

# kaniko
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/kaniko/0.5/kaniko.yaml
```

sonar-scanner \
  -Dsonar.host.url=http://localhost:9001 \
  -Dsonar.projectKey=devsecops-demo \
  -Dsonar.sources=. \
  -Dsonar.login=ac3a20962cd27a5ab69a1856bebce11dc9df68fb \
  -Dsonar.go.tests.reportPaths=report.json \
  -Dsonar.go.coverage.reportPaths=coverage.out\	
  -Dsonar.go.golangci-lint.reportPaths=lint.xml \
  -Dsonar.go.govet.reportPaths='vet.txt' \
  -Dsonar.test.inclusions='**/*_test.go'


go test -coverprofile=coverage.out -json >| report.json