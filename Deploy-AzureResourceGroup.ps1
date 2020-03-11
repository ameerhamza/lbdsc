# #region login to Azure

# $rgName = 'automationrg'
# $autoaccountName = 'autoaccount'
# $connectionName = "AzureRunAsConnection"

# $VerbosePreference = "Continue"
# $conn = Get-AutomationConnection `  -Name $connectionName 


# Write-Verbose $("[*]Logging in to Azure...")
  
# $connectionResult = Connect-AzAccount `
#     -TenantId $conn.TenantID `
#     -ApplicationId $conn.ApplicationID `
#     -CertificateThumbprint $conn.CertificateThumbprint `
#     -ServicePrincipal

# Write-Verbose "[*]Logged in."

# $subscription = Get-AzSubscription -SubscriptionId $conn.SubscriptionId
# Set-AzContext -Subscription $subscription
# #endregion

Write-Verbose "[*]Creating Resource Group"
$rg = New-AzResourceGroup -Name lbrg -Location eastus -Force

Write-Verbose "[*]Creating Resource Group Deployment"

New-AzResourceGroupDeployment -Name "az-deploy-01" -ResourceGroupName $rg.ResourceGroupName -Location $rg.Location `
    -TemplateUri "https://raw.githubusercontent.com/ameerhamza/lbdsc/master/network.json"  `
    -TemplateParameterUri "https://raw.githubusercontent.com/ameerhamza/lbdsc/master/network.parameters.json"

$vnet = 'vnet'
$lbsubnet = 'lbsubnet'
$vmsubnet = 'vmsubnet'
