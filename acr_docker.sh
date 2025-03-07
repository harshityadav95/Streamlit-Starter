## Deploy Docker image to azure container registry

# Variables
ACR_NAME=ravencroftarchive
IMAGE_NAME=hellostreamlit
IMAGE_TAG=latest

# Azure login
# az login

# Set Azure Subscription
#az account set --subscription <ID>

# Enable admin user
az acr update --name $ACR_NAME --admin-enabled true

# Get ACR details
ACR_LOGIN_SERVER=$(az acr show --name $ACR_NAME --query loginServer --output tsv)
ACR_USERNAME=$(az acr credential show --name $ACR_NAME --query username --output tsv)
ACR_PASSWORD=$(az acr credential show --name $ACR_NAME --query passwords[0].value --output tsv)

# Docker login
docker login $ACR_LOGIN_SERVER --username $ACR_USERNAME --password $ACR_PASSWORD

# Build and tag image
docker build -t $IMAGE_NAME:$IMAGE_TAG .
docker tag $IMAGE_NAME:$IMAGE_TAG $ACR_LOGIN_SERVER/$IMAGE_NAME:$IMAGE_TAG

# Push image
docker push $ACR_LOGIN_SERVER/$IMAGE_NAME:$IMAGE_TAG

# Verify (optional)
az acr repository list --name $ACR_NAME --output table

# End of script


