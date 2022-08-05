# docker multistage multiarch golang

In this directory
```

# check/edit main.go
go mod init dummy     # this creates the file go.mod 

# check/edit Dockerfile - multi-stage build

# prepare buildx
docker buildx create --use
docker ps | grep buildx

# build and push the multi-arch docker image
docker buildx build --platform linux/amd64,linux/arm64  --push -t vvang/dummy:0.9 .

# use the docker image

