FROM golang:latest AS Builder

RUN GIT_TAG="v1.2.0" && \
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $GIT_TAG && \
    go install github.com/golang/protobuf/protoc-gen-go

FROM alpine:latest
RUN apk update && apk --no-cache add protobuf
WORKDIR /tmp
# Grpc code setting
ENV GRPC_PLUGIN_PATH=/protoc-gen-go
ENV GO_OUT_PATH=/tmp/grpc/output/.
ENV PROTO_PATH=/tmp/grpc/idl/
# Copy Plugin
COPY --from=Builder /go/bin/protoc-gen-go /protoc-gen-go

