targetScope = 'resourceGroup'

param vnet1 string = 'uk-south-vnet1'
param vnetlocation string = 'uk south'
param uksvmnicname string = 'uksvm1nic'
param subnetvnet1 string = 'subnet01-uk-south-vnet1'

resource uksouthvn1 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnet1
  location: vnetlocation

  properties: {
    addressSpace: {
      addressPrefixes: ['10.10.0.0/16']
    } 
  
    subnets: [ {
      name: subnetvnet1
      properties: {
        addressPrefix: '10.10.0.0/24'
      }

    } ]
  
  }
  }

  resource uksvmnicrs 'Microsoft.Network/networkInterfaces@2023-05-01' = {
    name: uksvmnicname
    location: vnetlocation
    properties: {
      ipConfigurations: [
        {
          name: 'Ipconfig1'
          properties: {
            privateIPAllocationMethod: 'Dynamic'
            subnet: {
              id: resourceId('microsoft.network/virtualnetworks/subnets', vnet1, subnetvnet1)
            }
          }

        }
      ]
    } 

    dependsOn: [
        uksouthvn1
    ]
    
  }

 
