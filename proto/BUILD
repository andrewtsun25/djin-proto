load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "djin_proto_lib",
    srcs = [
        "organization.proto",
        "organization.rpc.proto",
        "service.proto",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@com_google_protobuf//:wrappers_proto",
    ],
)
