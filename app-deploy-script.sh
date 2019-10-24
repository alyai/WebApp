#!/bin/bash

# This script connects to Azure Cloud account - you need to enter the password when prompted
#


read -sp "Azure password: " AZ_PASS && echo && az login -u gmgold@gmail.com -p $AZ_PASS

az extension add --name "azure-devops"
sleep 5

az devops login --organization https://dev.azure.com/iqwebapp/
read -p "Connecting to Azure DevOps account..." -t 6


az pipelines build queue --definition-name "webapp-challenge-app - CI" --project webapp-challenge-project -o table
read -p "Creating the build..." -t 40
echo "Done!"

echo "Showing the list of all builds..."
sleep 10
az pipelines build list --definition-ids 1 --project webapp-challenge-project -o table
sleep 5
echo "Done!"

read -p "Deploying the latest release..." -t 30
echo "Showing the list of all releases..."
sleep 6

az pipelines release list --definition-id 1 --project webapp-challenge-project -o table
sleep 10
echo "Done!"
sleep 5


webappname=https://webapp-challenge-app.azurewebsites.net

# Web App URL.
echo "WebApp URL:"
echo $webappname

sleep 5
read -p "WebApp will be opened in browser now..." -t 3

# Open URL in browser
az webapp browse --name webapp-challenge-app --resource-group webapp-challenge-app-rg
