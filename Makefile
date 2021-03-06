all: deps test 
deps:
	GOOS=js GOARCH=wasm go get ./...
test: 
	GOOS=js GOARCH=wasm go test ./...
test-cover:
	$(GOPATH)/bin/mockgen -source=dom/dom.go -destination=mock/dom.go -package=mock
	$(GOPATH)/bin/mockgen -source=vnode.go -destination=mock/node.go -package=mock
	GOOS=js GOARCH=wasm go test ./... -coverprofile=cover.out
	go tool cover -html=cover.out