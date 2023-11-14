targetScope = 'subscription'

module rgapmod1 'myresourcegroups.bicep' = {
  name: 'rgap1'
  params: {
    rgname: rg
  }
}
