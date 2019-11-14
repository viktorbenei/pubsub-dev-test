FROM golang:1.13

# build the binary
ADD . /src
# The `-mod=vendor` flag instructs the go tool to use the vendor dir,
#  otherwhise the vendor/ dir is ignored in 1.11 module mode.
#  For more info see: https://github.com/golang/go/wiki/Modules#how-do-i-use-vendoring-with-modules-is-vendoring-going-away
RUN cd /src \
    # && go build -mod=vendor -o /go/bin/server ./server
    && go build -o /go/bin/server .


FROM ubuntu:18.04
COPY --from=0 /go/bin/server /app/server

# runtime dependencies
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ca-certificates \
    # for testing
    curl

CMD ["/app/server"]