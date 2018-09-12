#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="asia-southeast1-b"

# Create a cluster with alpha features so we can do process namespace sharing
gcloud container clusters create my-apps \
  --cluster-version 1.10.2-gke.4 \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --preemptible \
  --machine-type n1-standard-1 \
  --num-nodes 3 \
  --enable-kubernetes-alpha \
  --no-enable-autorepair \
  --no-enable-autoupgrade \
  --scopes "cloud-platform" \
  --zone "${ZONE}"
