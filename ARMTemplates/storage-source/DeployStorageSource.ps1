
Login-AzureRmAccount 




$Src_RG = Get-AzureRmResourceGroup -ResourceGroupName Source 
$templateFilePath = ".\template.json"
$parametersFilePath = ".\parameters.json"


New-AzureRmResourceGroupDeployment -ResourceGroupName $Src_RG.ResourceGroupName -TemplateFile $templateFilePath -TemplateParameterFile $parametersFilePath 

