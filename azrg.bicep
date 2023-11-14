
targetScope = 'subscription'
param location array = ['US East', 'US Central', 'US West']

param azrgnames array = [ 'us-east-rg-infra', 'us-central-rg-comms', 'us-west-rg-sap' ]

resource azrg 'Microsoft.Resources/resourceGroups@2023-07-01' = [for i in azrgnames: {
 name: 'az-${i}'
 location: location[i]
 } ]
