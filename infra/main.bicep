targetScope = 'subscription'


@minLength(1)
@maxLength(10)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

@description('Id of the user or app to assign application roles')
param principalId string = ''

var abbrs = loadJsonContent('./abbreviations.json')

// tags that should be applied to all resources.
var tags = {
  // Tag all resources with the environment name.
  'azd-env-name': environmentName
  SecurityControl: 'Ignore'
}


var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))

// Organize resources in a resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
  tags: tags
}

module resources 'resources.bicep' = {
  scope: rg
  name: 'resources'
  params: {
    suffix: resourceToken
    principalId: principalId
    tags: tags
  }
}

// Add outputs from the deployment here, if needed.
//
// This allows the outputs to be referenced by other bicep deployments in the deployment pipeline,
// or by the local machine as a way to reference created resources in Azure for local development.
// Secrets should not be added here.
//
// Outputs are automatically saved in the local azd environment .env file.
// To see these outputs, run `azd env get-values`,  or `azd env get-values --output json` for json output.
output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
// Container outputs

// // Application outputs
// output AZURE_CONTAINER_APP_ENDPOINT string = web.outputs.endpoint
// output AZURE_CONTAINER_ENVIRONMENT_NAME string = web.outputs.envName

// Identity outputs
output AZURE_USER_ASSIGNED_IDENTITY_NAME string = resources.outputs.identity
