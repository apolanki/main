targetScope= 'resourceGroup'

resource existingstg 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: 'uksstoragepolanki1'
  scope: resourceGroup('rg-uks-app-test5')

  
  }



output displaystg string = existingstg.name
output displaystglocation string = existingstg.location
