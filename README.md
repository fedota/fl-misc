# Federated Learning Miscellaneous
- Scripts required for setting up the system
- other miscellaneous directories used during developement

### Setup the FL workspace

1. Install [go](https://golang.org/doc/install) and [python](https://www.python.org/downloads/)
2. Install gRPC for [go](https://grpc.io/docs/quickstart/go/) and [python](https://grpc.io/docs/quickstart/python)
3. Set directory strucuture in your $GOPATH/src as
	```
	src/
		fedota/
			fl-misc
	```
4. Setup
	```
	cd fl-misc
	chmod +x fl_setup.sh
	./fl_setup.sh
	```
	Directory structure should then look like
	```
	src/
		fedota/
			fedota-infra
			fl-client
			fl-coordinator
			fl-misc
			fl-proto
			fl-selector
			fl-webserver
	```
5. [Optional] If you require proto definitions to be compiled
	```
	cd fl-misc
	chmod +x fl_proto.sh
	./fl_proto.sh
	```

### Other Resources
- https://golang.org/doc/code.html
- https://askubuntu.com/questions/1072683/how-can-i-install-protoc-on-ubuntu-16-04
- https://blog.golang.org/using-go-modules


### Using pre-commit-hooks

- Install [pre-commit](https://pre-commit.com/) using:

`pip install pre-commit`

- Install missing tools:
```
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/sqs/goreturns
go get -u github.com/mdempsky/gocode
go get -u github.com/alecthomas/gometalinter
go get -u github.com/mgechev/revive
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u github.com/zmb3/gogetdoc
go get -u github.com/zmb3/goaddimport
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/fatih/gomodifytags
go get -u github.com/tpng/gopkgs
go get -u github.com/ramya-rao-a/go-outline
```

- Run pre-commit hooks manually on all files:

`pre-commit run --all-files`

This will use the `.pre-commit-config.yaml` configuration

- Additionally if you want to run the hooks before every commit, use:

`pre-commit install`

This will add the required git hooks to be executed