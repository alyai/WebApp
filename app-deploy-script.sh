#!/bin/bash

# This script connects to Azure Cloud account (you need to enter the password ans token when prompted) and
# creates new build of ASP.NET Core Web App, creating a new release and pushing to prduction on Azure App Service. 
# The source code is hosted in GitHub Repository. When the source code is updated and pushed to GitHub Azure DevOps
# automatically deploy it to production.


az extension add --name "azure-devops"
sleep 5

# Login to Azure DevOps. Will prompt for token.
az devops login --organization https://dev.azure.com/iqwebapp/
read -p "Connecting to Azure DevOps account..." -t 6

# Running the build on Azure DevOps from the source code on GitHub, deploying the release to production.
az pipelines build queue --definition-name "webapp-challenge-app - CI" --project webapp-challenge-project
sleep 7
read -p "Creating the build..." -t 40
echo "Done!"

# Show the list of all builds done with statuses.
echo "Showing the list of all builds..."
sleep 10
az pipelines build list --definition-ids 1 --project webapp-challenge-project -o table
sleep 5
echo "Done!"

# Displaying informative message. 
read -p "Deploying the latest release..." -t 30
echo "Showing the list of all releases..."
sleep 6

# Show the list of all releases with their statuses.
az pipelines release list --definition-id 1 --project webapp-challenge-project -o table
sleep 10
echo "Done!"
sleep 5

# Web App URL.
webappname=https://webapp-challenge-app.azurewebsites.net

# Dispaly the Web App URL
echo "WebApp URL:"
echo $webappname

sleep 5
read -p "The website is getting ready and will be opened in the browser withing a few moments..." -t 40

# Open Web App URL in browser
az webapp browse --name webapp-challenge-app --resource-group webapp-challenge-app-rg