targetScope =  'subscription'

//var rgn = 'rg-uks-app-test5'
//param resourceGroupName string
//param locationName string
resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' existing = {
  name: 'rg-uks-app-test5'
  //location: 'uksouth'
}

output rgnout string = rg.name
