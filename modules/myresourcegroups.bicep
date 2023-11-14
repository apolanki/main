
targetScope = 'subscription'

param rgname string = 'aprg'
param rglocationname string = 'uksouth'
//type resourcegrouptags object
resource aprgmod 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgname
  location: rglocationname
  tags: {
    Environment: 'Production'
    Service: 'Applications'
    owner: 'ApplicationSupportTeam'
  }
}
