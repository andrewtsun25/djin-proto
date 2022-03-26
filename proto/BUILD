load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "djin_proto_lib",
    srcs = [
        "hbvResearchPaper.proto",
        "hbvResearchPaper.rpc.proto",
        "holisticOfficeLink.proto",
        "holisticOfficeLink.rpc.proto",
        "holisticOfficeModule.proto",
        "holisticOfficeModule.rpc.proto",
        "martialArtsStudio.proto",
        "martialArtsStyle.proto",
        "martialArtsStyle.rpc.proto",
        "organization.proto",
        "organization.rpc.proto",
        "service.proto",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@com_google_protobuf//:timestamp_proto",
        "@com_google_protobuf//:wrappers_proto",
    ],
)
