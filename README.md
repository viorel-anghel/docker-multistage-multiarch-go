# docker multistage multiarch golang

ref: https://www.docker.com/blog/how-to-rapidly-build-multi-architecture-images-with-buildx/

In this directory

```
# check/edit main.go
go mod init dummy     # this creates the file go.mod 

# check/edit Dockerfile - multi-stage build

# prepare buildx
docker buildx create --platform=linux/arm64,linux/amd64,linux/amd/v7 --use
docker ps | grep buildx

# build and push the multi-arch docker image
docker buildx build --platform linux/amd64,linux/arm64,linux/amd/v7  --push -t vvang/dummy:0.9 .

# use the docker image
```

