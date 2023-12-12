# Connect to Azure Portal interactively
Connect-AzAccount -Tenant '<Tenant-id>'


# Get all subscriptions
$subscriptions = Get-AzSubscription

# Create empty arrays to store policy definitions, assignments, and initiatives
$allPolicyDefinitions = @()
$allPolicyAssignments = @()
$allPolicyInitiatives = @()

# Loop through each subscription
foreach ($subscription in $subscriptions) {
    # Set the context to the current subscription
    Set-AzContext -Subscription $subscription.Id

    # Get policy definitions
    $policyDefinitions = Get-AzPolicyDefinition
    # Add policy definitions to the array
    $allPolicyDefinitions += $policyDefinitions

    # Get policy assignments
    $policyAssignments = Get-AzPolicyAssignment
    # Add policy assignments to the array
    $allPolicyAssignments += $policyAssignments

    # Get policy initiatives
    $policyInitiatives = Get-AzPolicySetDefinition
    # Add policy initiatives to the array
    $allPolicyInitiatives += $policyInitiatives
}

# Export policy definitions, assignments, and initiatives to CSV files
$allPolicyDefinitions | Export-Csv -Path 'policyDefinitions.csv' -NoTypeInformation
$allPolicyAssignments | Export-Csv -Path 'policyAssignments.csv' -NoTypeInformation
$allPolicyInitiatives | Export-Csv -Path 'policyInitiatives.csv' -NoTypeInformation
