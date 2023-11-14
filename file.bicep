
//param storageAccountName string

param locationName string = resourceGroup().location
param storageAccountCount int = 5
resource stg 'Microsoft.Storage/storageAccounts@2023-01-01' =[for i in range(0, storageAccountCount) : {
  
  name: 'sauksouthpolanki${i}'
  location: locationName
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  properties: {
    accessTier: 'Cool'
    
  }



}

]

resource stglock 'Microsoft.Authorization/locks@2020-05-01' = {
  name: 'storageaccountlock'
  properties: {
    level: 'CanNotDelete'
    notes: 'Storage cant be deleted'
  }
}

