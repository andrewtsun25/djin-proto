#!/bin/bash

# Requires protoc & gcloud to be installed and configured correctly via the setup.
# Set GOOGLEAPI_DIRS variable prior to running

# Fail on any error
set -eo pipefail

# Output Directory
OUTPUT_DIR="out"

# Deployment parameters
API_CONFIG="./api_config.yaml"
DESCRIPTOR_PB="${OUTPUT_DIR}/api_descriptor.pb"

# Protobuf directories
PROTO_ROOT="proto/dev/djin"
ENTITY_DIR="${PROTO_ROOT}/entity/v1"
RPC_DIR="${PROTO_ROOT}/rpc/v1"
SERVICE_DIR="${PROTO_ROOT}/service/v1"

# Should execute both commands from repo root
cd ../

# Create output directory if it did not already exist.
if [[ ! -d ${OUTPUT_DIR} ]]; then
  mkdir ${OUTPUT_DIR}
fi

# Create API descriptor proto
protoc \
  --include_imports \
  --include_source_info \
  --proto_path="./" \
  --proto_path="${GOOGLEAPIS_DIR}" \
  --descriptor_set_out="${DESCRIPTOR_PB}" \
  "$(find "${ENTITY_DIR}/*.proto")" \
  "$(find "${RPC_DIR}*.proto")" \
  "$(find "${SERVICE_DIR}/*.proto")"

# Deploy to gCloud services
gcloud endpoints services deploy ${DESCRIPTOR_PB} ${API_CONFIG}