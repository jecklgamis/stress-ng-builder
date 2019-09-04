## stress-ng-builder 

A docker container for building `stress-ng` binaries 

## Building 

Ubuntu builder:
```
cd ubuntu && make all
```
This will build and start the Docker container and download the `stress-ng-linux` 
binary from `http://localhost:3080`

```
```
Localhost builder (ensure you have gcc installed):
```
cd localhost && make all
```