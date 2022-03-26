# Protobufs for djin.dev

This Git repository contains gRPC & entity definitions that are to be shared between client and 
server. Server code will be generated in Go, while client code will be generated in TypeScript. Upon 
commiting to this repository, updated stubs for client & server will be generated and published 
into Buf.

## Frequently Used Commands

### Build server-side Go stubs
```
buf generate buf.build/andrewtsun25/djin
```

### Build client-side TypeScript stubs
```
buf generate buf.build/andrewtsun25/djin
```
