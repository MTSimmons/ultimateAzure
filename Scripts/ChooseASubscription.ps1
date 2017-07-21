<#
 Author: Michael Simmons
 Description:   Login to Azure and choose a subscription
#>

Login-AzureRmAccount

$Subscription = Get-AzureRmSubscription | Select SubscriptionName, SubscriptionId | Out-GridView -Title "Choose a subscription" -PassThru
Select-AzureRmSubscription -SubscriptionId $Subscription.SubscriptionId
