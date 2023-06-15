#.PHONY: build clean deploy
#
#build:
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/send ./functions/send/main.go
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/forward ./functions/forward/main.go
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/batch ./functions/batch/main.go
#
#build-send:
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/send ./functions/send/main.go
#
#build-forward:
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/forward ./functions/forward/main.go
#
#build-batch:
#	env GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -ldflags="-s -w" -o ./bin/batch ./functions/batch/main.go
#
#clean:
#	rm -rf ./bin ./vendor Gopkg.lock
#
#local: build
#	sls offline -s $(STAGE)
#
#deploy: clean build
#	sls deploy -s $(STAGE)
#
#deploy-send: clean build-send
#	sls deploy -s $(STAGE) -f send
#
#deploy-forward: clean build-forward
#	sls deploy -s $(STAGE) -f forward
#
#deploy-batch: clean build-batch
#	sls deploy -s $(STAGE) -f batch
#
#test-send: build-send
#	sls invoke local -s $(STAGE) -f send -p ./mock/event.json
#
#test-forward: build-forward
#	sls invoke local -s $(STAGE) -f forward -p ./mock/event.json
#
#test-batch: build-batch
#	sls invoke local -s $(STAGE) -f batch -p ./mock/event.json
#
#format:
#	gofmt -w functions/**/*.go