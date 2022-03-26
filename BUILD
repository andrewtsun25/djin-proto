# Go library
load("@rules_proto_grpc//go:defs.bzl", "go_grpc_library")

go_grpc_library(
    name = "djin_go_proto",
    importpath = "github.com/andrewtsun25/djin-proto",
    protos = [
        "//proto/entity:entity_proto",
        "//proto/service/organization:service_proto",
    ],
    verbose = 4,
    visibility = ["//visibility:public"],
)

# TypeScript library
load("@rules_proto_grpc//js:defs.bzl", "js_grpc_web_library")

js_grpc_web_library(
    name = "djin_ts_proto",
    protos = [
        "//proto/entity:entity_proto",
        "//proto/service/organization:service_proto",
    ],
)
