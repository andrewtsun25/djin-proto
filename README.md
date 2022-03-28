# djin-proto: Protobufs for djin.dev

This Git repository contains [gRPC](https://grpc.io/) & entity definitions that are to be shared between client and 
server of the site [djin.dev](https://djin.dev) using a common IDL language called 
[`protobuf`](https://developers.google.com/protocol-buffers). Server stubs will be generated in [Go](https://go.dev/), 
while client stubs will be generated in [TypeScript](https://go.dev/). Upon committing to this repository, updated stubs 
will be auto-generated and published into [Buf](https://buf.build/).

# Fetching Stubs

Protobuf stubs are available in [TypeScript](https://go.dev/) on the client side via npm and [Go](https://go.dev/) 
modules on the server side.

## Client-Side Stubs

Prerequisites: [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm), 
[TypeScript](https://www.typescriptlang.org/download)

After setting up your `.npmrc` to use Buf's `npm` registry via

```shell
npm config set @buf:registry https://npm.buf.build
```

Client-side stubs are available in [TypeScript](https://go.dev/) via
```shell
npm install @buf/grpc_web_andrewtsun25_djin
```

Note: This [feature](https://docs.buf.build/bsr/remote-generation/js) provided by Buf is currently 
in alpha.

## Server-Side Stubs

Prerequisites: [Go](https://go.dev/dl/)

Server-side stubs are available in Go via
```shell
go get go.buf.build/grpc/go/andrewtsun25/djin
```

Note: This [feature](https://docs.buf.build/bsr/remote-generation/go) provided by Buf is 
currently in alpha.

# Frequently Used Commands

Prerequisites: [Buf](https://docs.buf.build/installation)

## Linting

Linting ensures correctness of protos and buildability.
```shell
buf lint
```

## Check for Breaking Changes

Last thing we want to do is to break compatibility with past versions of this API. This step checks for breaking 
changes.
```shell
buf breaking
```

## Code Generation

This is the actual step that generates [Go](https://go.dev/) & [TypeScript](https://www.typescriptlang.org/) stubs
locally. 

```shell
buf generate
```


