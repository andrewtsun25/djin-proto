# Go library
load("@rules_proto_grpc//go:defs.bzl", "go_proto_library")

go_proto_library(
    name = "djin_entity_go_proto",
    importpath = "github.com/andrewtsun25/djin-proto",
    protos = [
        "//proto/entity:organization_proto",
    ],
)

# TypeScript library
load("@rules_proto_grpc//js:defs.bzl", "js_proto_library")

js_proto_library(
    name = "djin_entity_js_proto",
    protos = ["//proto/entity:organization_proto"],
)
