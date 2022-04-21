# djin-proto: Protobufs for djin.dev

This Git repository contains [gRPC](https://grpc.io/) & entity definitions that are to be shared between client and 
server of the site [djin.dev](https://djin.dev) using a common IDL language called 
[`protobuf`](https://developers.google.com/protocol-buffers). Server stubs will be generated in [Go](https://go.dev/), 
while client stubs will be generated in [TypeScript](https://go.dev/). Upon committing to this repository, updated stubs 
will be auto-generated and published into [Buf](https://buf.build/). Configurations for managing endpoints on 
GCP Endpoints are also present in this directory as well. 

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

# Setup

Install the following tools: 
- [`protoc`](https://grpc.io/docs/protoc-installation/)
- [gCloud CLI](https://cloud.google.com/sdk/gcloud)
- [`buf`](https://docs.buf.build/installation)

After [installing the gCloud CLI](https://cloud.google.com/sdk/gcloud), set the default project to `djin-dev`:

```shell
gcloud config set project djin-dev
```

Clone the [googleapis](https://github.com/googleapis/googleapis) library somewhere and assign the library root to the 
`GOOGLEAPIS_DIR` environment variable:

```shell
git clone https://github.com/googleapis/googleapis

GOOGLEAPIS_DIR=<your-local-googleapis-folder>
```

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

# Deployment to GCP Endpoints

If you change any of the endpoints in `proto/dev/djin/service`, you should also edit the corresponding `api_config.yaml`
and deploy the changes to GCP Endpoints.

This follows the instructions for [creating](https://cloud.google.com/endpoints/docs/grpc/set-up-cloud-run-espv2#endpoints_configure) 
and [deploying](https://cloud.google.com/endpoints/docs/grpc/set-up-cloud-run-espv2#deploy_configuration) endpoints, 
but here are the more specific steps that need to be done per deployment. We can use `deploy_endpoints_config.sh` but
this has not been officially tested yet. 

With [`protoc`](https://grpc.io/docs/protoc-installation/), generate the API descriptor proto via 
```shell
protoc \
--include_imports \ 
--include_source_info \
--proto_path="./" \
--proto_path=${GOOGLEAPIS_DIR}
--descriptor_set_out="api_descriptor.pb" \
`find proto/dev/djin/entity/v1/*.proto` \
`find proto/dev/djin/rpc/v1/*.proto` \
`find proto/dev/djin/service/v1/*.proto`
```

Deploy the API proto descriptor & the api config file via the Google Cloud CLI: 
```shell
gcloud endpoints services deploy api_descriptor.pb api_config.yaml
```

