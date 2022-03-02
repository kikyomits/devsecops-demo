FROM golang:alpine3.15

WORKDIR /go/src/github.com/kikyomits/devsecops-demo/
COPY *.go go.mod go.sum ./
RUN \
  go get && \
  CGO_ENABLED=0 GOOS=linux go build -o demo .

FROM alpine:3.15.0
WORKDIR /root/
COPY --from=0 /go/src/github.com/kikyomits/devsecops-demo/demo ./
RUN mv demo /usr/local/bin/
CMD ["/usr/local/bin/demo"]