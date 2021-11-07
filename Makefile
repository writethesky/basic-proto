BUF_VERSION:=1.0.0-rc6
PROTOC_VERSION:=3.19.1

install-tools:
	curl -SL \
    	"https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-$(shell uname -s)-$(shell uname -m)" \
    	-o "$(shell go env GOPATH)/bin/buf" && \
    	chmod +x "$(shell go env GOPATH)/bin/buf"

ifeq ($(shell uname -s),Darwin)
	curl -SL "https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOC_VERSION)/protoc-$(PROTOC_VERSION)-osx-$(shell uname -m).zip" -o protoc.zip
else
	curl -SL "https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOC_VERSION)/protoc-$(PROTOC_VERSION)-$(shell uname -s)-$(shell uname -m).zip" -o protoc.zip
endif
	unzip protoc.zip -d /usr/local
	rm -f protoc.zip


lint:
	buf lint
build:
	buf build