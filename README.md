## stress-ng-builder

Tools for building [`stress-ng`](https://github.com/ColinIanKing/stress-ng) (v0.20.01) binaries.

## Building

Ubuntu builder (Docker):
```
cd ubuntu && make all
```
This will build and start the Docker container and download the `stress-ng-linux`
binary from `http://localhost:3080`

Localhost builder (requires gcc):
```
cd localhost && make all
```
