# Protobufs for djin.dev

This Git repository contains gRPC & entity definitions that are to be shared between client and 
server of the site [djin.dev](https://djin.dev) using a common IDL language called `protobuf`. Server code will be 
generated in Go, while client code will be generated in TypeScript. Upon committing to this repository, updated stubs 
for client & server will be auto-generated and published into Buf.

# Getting Stubs

Protobuf stubs are available in TypeScript/JavaScript on the client side via npm and Go modules 
on the server side.

## Client-Side Stubs

After setting up your `.npmrc` to use Buf's `npm` registry via

```shell
npm config set @buf:registry https://npm.buf.build
```

Client-side stubs are available in TypeScript from
```shell
npm install @buf/grpc_web_andrewtsun25_djin
```

Note: This [feature](https://docs.buf.build/bsr/remote-generation/js) provided by Buf is currently 
in alpha.

## Server-Side Stubs

Server-side stubs are available in Go from
```shell
go get go.buf.build/grpc/go/andrewtsun25/djin
```

Note: This [feature](https://docs.buf.build/bsr/remote-generation/go) provided by Buf is 
currently in alpha.

# Frequently Used Commands

To use any of these commands, you will need to first 
[install Buf](https://docs.buf.build/installation) on your computer.

## Linting

```shell
buf lint
```

## Check for Breaking Changes
```shell
buf breaking
```

## Code Generation
```shell
buf generate
```


