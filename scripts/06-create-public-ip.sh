#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

REGION="asia-southeast1"

gcloud compute addresses create vault --region "${REGION}"
