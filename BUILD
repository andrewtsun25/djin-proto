# Go library
load("@rules_proto_grpc//go:defs.bzl", "go_grpc_library")

go_grpc_library(
    name = "djin_proto_lib_go",
    importpath = "github.com/andrewtsun25/djin-proto",
    protos = [
        "//proto:djin_proto_lib",
    ],
)

# TypeScript library
load("@rules_proto_grpc//js:defs.bzl", "js_grpc_web_library")

js_grpc_web_library(
    name = "djin_proto_lib_ts",
    protos = [
        "//proto:djin_proto_lib",
    ],
)
