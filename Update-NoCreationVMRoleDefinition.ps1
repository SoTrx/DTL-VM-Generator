$customRole = "No VM Creation User"

$roleDef = Get-AzRoleDefinition -Name $customRole

if(-not $roleDef) {
  Write-Error "No role $customRole in the subscription"
}

$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/claim/action")
$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/unclaim/action")
$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/start/action")
$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/stop/action")
$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/restart/action")
$roleDef.Actions.Add("Microsoft.DevTestLab/labs/virtualMachines/getRdpFileContents/action")

Set-AzRoleDefinition -Role $roleDef

