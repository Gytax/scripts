#Requires -RunAsAdministrator

Set-Variable -Name 'GPUInstanceId' -Value 'PCI\VEN_10DE&DEV_2191&SUBSYS_00321414&REV_A1\4&3208D4ED&0&00EC'
Disable-PnpDevice -InstanceId $GPUInstanceId -Confirm:$false
Enable-PnpDevice -InstanceId $GPUInstanceId -Confirm:$false
