targetScope= 'resourceGroup'
/**/
param vmname string = 'uksvm1'
param vmlocation string = 'uk south'
@description('User name for the VM:')
param adminusername string = 'ablyle'
@description('Password for the VM:')
@secure()
param adminpassword string
param OSVersion string = '2022-datacenter-azure-edition'
//param uksvmnicname string

param vnet1 string = 'uk-south-vnet1'
param vnetlocation string = 'uk south'
param uksvmnicname string = 'uksvm1nic'
param subnetvnet1 string = 'subnet01-uk-south-vnet1'

param uksstoragename1 string = 'uksstoragepolanki1'
param uksstoragelocationname1 string = 'uksouth'
/**/

resource uksstorageaccount1 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: uksstoragename1
  location: uksstoragelocationname1
  kind: 'Storage'
  sku: {
    name: 'Standard_LRS'
  }



}


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

resource vmdatadisks 'Microsoft.Compute/disks@2023-04-02' = {
  name: 'DataDisk01'
  location: uksstoragelocationname1


  properties: {
    diskSizeGB: 1
    creationData: {
      createOption: 'Empty'
    
    }
  }
}

resource uksvm1 'Microsoft.Compute/virtualMachines@2023-07-01' = {
  name: vmname
  location: vmlocation
properties: {
  hardwareProfile: {
    vmSize: 'Standard_B1s'
  }

  osProfile: {
    computerName: vmname
    adminUsername: adminusername
    adminPassword: adminpassword
  }
  storageProfile: {
    imageReference: {
      publisher: 'MicrosoftWindowsServer'
      offer: 'WindowsServer'
      sku: OSVersion
      version: 'latest'
    }
    osDisk: {
      createOption: 'FromImage'
      managedDisk: {
        storageAccountType: 'StandardSSD_LRS'
      }
    }
    dataDisks: [
      {
        name: vmdatadisks.name
        createOption: 'Attach'
        lun: 0
        diskSizeGB: 1
        
        managedDisk: {
          id: vmdatadisks.id
        }

      }
    ]
  }


  networkProfile: {

    networkInterfaces: [
      {
        id: uksvmnicrs.id
      }
    ]
  }

}

}


  
 