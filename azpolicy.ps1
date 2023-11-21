# Connect to Azure Portal interactively

Connect-AzAccount -Tenant '<Tenant_Id>'

# Get all subscriptions
$subscriptions = Get-AzSubscription

# Loop through each subscription 
foreach ($subscription in $subscriptions) {
    # Set the context to the current subscription
    Set-AzContext -Subscription $subscription.Id

    
    Write-Host "----------------Policy assignments----------------"

    # Get policy assignments
    $policyAssignments = Get-AzPolicyAssignment | Select-Object -ExpandProperty properties | Select-Object -Property DisplayName, PolicyDefinitionId, Scope | Format-List
    
    # Output policy assignments
    $policyAssignments | Format-Table

    Write-Host "----------------Policy definitions----------------"

    # Get policy definitions
    $policyDefinitions = Get-AzPolicyDefinition | Select-Object -ExpandProperty properties | Select-Object -Property  Description, DisplayName, Metadata, Mode, Parameters, PolicyRule, PolicyType | Format-List

    # Output policy definitions
    $policyDefinitions | Format-Table 

  
    Write-Host "----------------Policy initiatives----------------"

    # get all initiatives and definitions 
    $initiatives = Get-AzPolicySetDefinition | Select-Object -ExpandProperty properties | Select-Object -Property Description, DisplayName, Metadata, Parameters, PolicyDefinitions, PolicyType | Format-List

    # output initiatives and definitions
    $initiatives | Format-Table
}





