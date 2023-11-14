//using 'myresourcegroups.bicep'

param rgname = 'aprg'
param vmname  = 'uksvm1'
param vmlocation  = 'uk south'
@description('User name for the VM:')
param adminusername  = 'ablyle'
@description('Password for the VM:')
@secure()
param adminpassword = ''
param OSVersion  = '2022-datacenter-azure-edition'
//param uksvmnicname string

param vnet1  = 'uk-south-vnet1'
param vnetlocation  = 'uk south'
param uksvmnicname  = 'uksvm1nic'
param subnetvnet1  = 'subnet01-uk-south-vnet1'

param uksstoragename1  = 'uksstoragepolanki1'
param uksstoragelocationname1  = 'uksouth'
