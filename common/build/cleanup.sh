#!/bin/bash

# Import the settings from the common settings file
source ../project_settings.sh

#delete fire-wall rule
gcloud compute firewall-rules delete --quiet pk-fs-dev-app-network-internal-access
gcloud compute firewall-rules delete --quiet pk-fs-dev-app-network-ssh

#delete the subnet
gcloud compute networks subnets delete --region us-central1 --quiet pk-fs-dev-ad-app-network-subnet
gcloud compute networks subnets delete --region us-central1 --quiet pk-fs-dev-prod-app-network-subnet

#delete the custom network
gcloud compute networks delete pk-fs-dev-app-network --quiet

#remove private bucket
gsutil rb gs://pk-fs-dev-private-bucket

#remove public bucket
gsutil rb gs://pk-fs-dev-public-bucket



# Shared services
# Disable Storage.
gcloud services disable storage-component.googleapis.com
# Disable Bigtable.
gcloud services disable bigtable.googleapis.com
# Disable Stackdriver
gcloud services disable stackdriver.googleapis.com
# Disable Cloud SQL
gcloud services disable sql-component.googleapis.com
# Disable Datastore
gcloud services disable datastore.googleapis.com


# The frontend application
# Disable App Engine
gcloud services disable appengine.googleapis.com
# Disable Pubsub
gcloud services disable pubsub.googleapis.com

# Image processor
# Disable Cloud Vision API
gcloud services disable vision.googleapis.com
# Disable Cloud Functions
gcloud services disable cloudfunctions.googleapis.com

# The product application
# Disable Kubernetes Engine
gcloud services disable container.googleapis.com
# Disable Bigquery
gcloud services disable bigquery-json.googleapis.com
# Disable Container Registry
gcloud services disable containerregistry.googleapis.com 

# The ads application
# Disable Compute Engine
gcloud services disable compute.googleapis.com
# Disable Spanner
gcloud services disable spanner.googleapis.com  
