default:
	cat ./Makefile

VERSION:=0.10.04
all: download-source build
build:
	rm -rf stress-ng-${VERSION}
	tar xvf V${VERSION}.tar.gz && cd stress-ng-${VERSION} && STATIC=1 make
download-source:
	curl -sfLO https://github.com/ColinIanKing/stress-ng/archive/V${VERSION}.tar.gz
