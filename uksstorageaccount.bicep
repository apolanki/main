targetScope= 'resourceGroup'

param uksstoragename1 string = 'uksstoragepolanki1'
param uksstoragelocationname1 string = 'uksouth'

resource uksstorageaccount1 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: uksstoragename1
  location: uksstoragelocationname1
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }

  resource fileservices 'fileServices@2023-01-01' = {
    name: 'default'

  resource sharedfolder1 'shares@2023-01-01' = {
    name: 'Department' 
    properties: {
      shareQuota: 1
      accessTier: 'Hot'
      enabledProtocols: 'SMB' 
      //rootSquash: 
    }
  } 
  }

}
