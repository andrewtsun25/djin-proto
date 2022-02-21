# Protobufs for djin.dev

This repository contains gRPC & entity definitions that are to be shared between client and server.
Server code will be generated in Go, while client code will be generated in TypeScript. Upon 
commiting to this repository, updated stubs for client & server will be generated and published 
into Google Cloud Artifacts, where they can both be pulled into the server & client repositories 
respectively. Since this project is multilingual, Bazel has been chosen to maintain dependencies 
for protobuf code generation. 

Setting up protos to generate Go/TypeScript libraries was done with help from the 
[`rules-proto-grpc`](https://rules-proto-grpc.com/en/latest/index.html) package and deployment 
to Google Cloud Artifacts. 

## Frequently Used Commands

### Build server Go stubs
```
bazel run ://djin-go-proto
```

### Build client TypeScript stubs
```
bazel run ://djin-go-proto
```



