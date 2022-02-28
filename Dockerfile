FROM golang:alpine3.15

WORKDIR /go/src/github.com/kikyomits/devsecops-demo/
COPY . ./
RUN \
  go get && \
  CGO_ENABLED=0 GOOS=linux go build -o app .


FROM alpine:3.15.0
WORKDIR /root/
COPY --from=0 /go/src/github.com/kikyomits/devsecops-demo/app ./
CMD ["./app"]