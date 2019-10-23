#!/bin/bash

az login -u <username> -p <password>

gitrepo=https://github.com/alyai/WebApp.git

token=914e54e7c6e78c33be248f00ed06d961091007ab
webappname=webapp-challenge-app$RANDOM

# Create a resource group.
az group create --location canadacentral --name devResourceGroup

# Create an App Service plan in `FREE` tier.
az appservice plan create --name $webappname --resource-group devResourceGroup --sku FREE

# Create a web app.
az webapp create --name $webappname --resource-group devResourceGroup --plan $webappname

# Configure continuous deployment from GitHub. 
# --git-token parameter is required only once per Azure account (Azure remembers token).
az webapp deployment source config --name $webappname --resource-group devResourceGroup \
--repo-url $gitrepo --branch master --git-token $token

# Copy the result of the following command into a browser to see the web app.
echo http://$webappname.azurewebsites.net