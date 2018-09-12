#!/usr/bin/env bash
set -e

if [ -z "${GOOGLE_CLOUD_PROJECT}" ]; then
  echo "Missing GOOGLE_CLOUD_PROJECT!"
  exit 1
fi

ZONE="asia-southeast1-b"

SERVICE_ACCOUNT="vault-server@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"

gcloud container clusters create vault \
  --enable-autorepair \
  --cluster-version 1.10.2-gke.4 \
  --enable-cloud-logging \
  --enable-cloud-monitoring \
  --machine-type n1-standard-1 \
  --num-nodes 3 \
  --service-account "${SERVICE_ACCOUNT}" \
  --zone "${ZONE}"
