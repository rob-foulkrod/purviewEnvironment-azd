# Purview Demo Environment

This repository includes instructions on how to automate the deployment of a pre-populated Microsoft Purview demo environment. It is forked from https://github.com/tayganr/purviewdemo and modified to support the AZD demployment tool. It can be deployed to Azure using the [Azure Developer CLI - AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/overview). 

💪 This template scenario is part of the larger **[Microsoft Trainer Demo Deploy Catalog](https://aka.ms/trainer-demo-deploy)**.

## ⬇️ Installation
- [Azure Developer CLI - AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd)
    - When installing AZD, the above the following tools will be installed on your machine as well, if not already installed:
        - [GitHub CLI](https://cli.github.com)
        - [Bicep CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)
    - You need Owner or Contributor access permissions to an Azure Subscription to  deploy the scenario.

## 🚀 Deploying the scenario in 4 steps:

1. **Create a new folder on your machine.**
   ```sh
   mkdir rob-foulkrod/purviewEnvironment-azd
   ```

2. **Navigate to the new folder.**
   ```sh
   cd rob-foulkrod/purviewEnvironment-azd
   ```

3. **Initialize the deployment with `azd init`.**
   ```sh
   azd init -t rob-foulkrod/purviewEnvironment-azd
   ```

4. **Trigger the actual deployment with `azd up`.**
   ```sh
   azd up
   ```

⏩ Note: you can delete the deployed scenario from the Azure Portal, or by running ```azd down``` from within the initiated folder.

## What is the demo scenario about?

- Use the [demo guide](./Demoguide/Demoguide.md).

## 💭 Feedback and Contributing
Feel free to create issues for bugs, suggestions or Fork and create a PR with new demo scenarios or optimizations to the templates. 
If you like the scenario, consider giving a GitHub ⭐
 
