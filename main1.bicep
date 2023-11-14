
targetScope = 'resourceGroup'
param resourcelocation string = 'uk south'
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  
  name: 'vnet-uksouth-01'
  location: resourcelocation
  tags: {
    Environment : 'Test'
    Owner : 'Comms-Team'
  }
   properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/15']
    }
    enableVmProtection: false
    enableDdosProtection: false
    subnets: [ {
        name: 'subnet01-vnet-uksouth-01'
        properties: {
        addressPrefix: '10.0.0.0/24'
        }
      }
     
        ]
   }
}
