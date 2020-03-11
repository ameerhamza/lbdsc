$rg = Get-AzResourceGroup -Name automationrg
$aaname = 'autoaccount'
$runbookName = "LBAutomationRunbook"

Import-AzAutomationRunbook `
  -AutomationAccountName $aaname `
  -Name $runbookName `
  -ResourceGroupName $rg.ResourceGroupName `
  -Path "C:\Users\a.hamza\source\repos\scripts\Azure DSC\LoadBalancedVMs\Deploy-AzureResourceGroup.ps1" `
  -Type PowerShell `
  -Force
