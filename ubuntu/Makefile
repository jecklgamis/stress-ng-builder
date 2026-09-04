default:
	cat ./Makefile
image:
	docker build -t stress-ng-builder-ubuntu:latest .
run:
	docker run -p 3080:3080  stress-ng-builder-ubuntu:latest
run-bash:
	docker run -i -t stress-ng-builder-ubuntu /bin/bash
run-daemon:
	docker run -d -p 3080:3080  stress-ng-builder-ubuntu:latest
cid=$(shell docker ps | grep stress-ng-builder-ubuntu | awk '{ print $$1 }')
stop:
	if [ ! -z "${cid}" ]; then docker stop ${cid}; fi
download-binary:
	@for i in $$(seq 1 30); do curl -sf -o ./stress-ng http://localhost:3080/stress-ng && break || sleep 1; done
	@test -s ./stress-ng && mv ./stress-ng ./stress-ng-linux && echo "Wrote ./stress-ng-linux"
all: image run-daemon download-binary stop