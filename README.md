

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
  -Dsonar.test.inclusions='**/*_test.go' \
  -Dsonar.qualitygate.wait=true


go test -coverprofile=coverage.out -json >| report.json

mkikyotani/

```shell
docker run -it --rm \
  -v `pwd`:/workspace \
  -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
  gcr.io/kaniko-project/executor:v1.7.0 \
  --dockerfile=Dockerfile \
  --tarPath=devsecops-demo.tar.gz \
  --destination=docker.io/mkikyotani/devsecops-demo:0.0.1 \
  --no-push


docker run -it --rm \
  -v `pwd`:/workspace \
  -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
  gcr.io/kaniko-project/executor:v1.7.0 \
  --dockerfile=Dockerfile \
  --tarPath=devsecops-demo.tar.gz \
  --destination=docker.io/mkikyotani/devsecops-demo:0.0.1 \
  --no-push
  
docker run -it --rm \
  -v `pwd`:/workspace \
  -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
  gcr.io/kaniko-project/executor:v1.7.0 \
  --dockerfile=Dockerfile \
  --tarPath=devsecops-demo.tar \
  --destination=docker.io/mkikyotani/devsecops-demo:0.0.1 \
  --no-push
 
docker run -it --rm \
  -v `pwd`:/workspace \
  -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
  gcr.io/kaniko-project/executor:v1.7.0 \
  --context=tar://devsecops-demo.tar.gz \
  --destination=docker.io/mkikyotani/devsecops-demo:0.0.1
```

crane push ./devsecops-demo.tar.gz docker.io/mkikyotani/devsecops-demo:0.0.1

docker run -it --rm \
  -v `pwd`:/workspace \
  -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
  gcr.io/kaniko-project/executor:v1.7.0 \
  --dockerfile=Dockerfile \
  --tarPath=devsecops-demo.tar \
  --destination=xxx \
  --no-push