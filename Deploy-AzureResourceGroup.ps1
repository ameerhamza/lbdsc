$rg = New-AzResourceGroup -Name lbrg -Location eastus

New-AzResourceGroupDeployment -Name "az-deploy-01" -ResourceGroupName $rg.ResourceGroupName -Location $rg.Location `
    -TemplateFile ".\network.json" -TemplateParameterFile ".\network.parameters.json"