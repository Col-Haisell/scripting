# Add the correct 'Object (principal) ID' for the Managed Identity
$ObjectId = "4dd4d958-1794-4791-94c8-ce88d6868abb"
 
# Add the correct Graph scope to grant
$graphScope = "Sites.Selected"
 
Connect-MgGraph -Scope AppRoleAssignment.ReadWrite.All -UseDeviceCode
$graph = Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'"
$graphAppRole = $graph.AppRoles | ? Value -eq $graphScope
 
$appRoleAssignment = @{
    "principalId" = $ObjectId
    "resourceId"  = $graph.Id
    "appRoleId"   = $graphAppRole.Id
}
 
New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $ObjectID -BodyParameter $appRoleAssignment | Format-List
 
 
 
# Add the correct 'Application (client) ID' and 'displayName' for the Managed Identity
$application = @{
    id = "4dd4d958-1794-4791-94c8-ce88d6868abb"
    displayName = "AGAEALP3001542"
}
 
# Add the correct role to grant the Managed Identity (read or write)
$appRole = "write"
 
# Add the correct SharePoint Online tenant URL and site name
$spoTenant = "ausgrid.sharepoint.com"
$spoSite  = "SP0518"
 
# No need to change anything below
$spoSiteId = $spoTenant + ":/teams/" + $spoSite + ":"
 
Import-Module Microsoft.Graph.Sites
Connect-MgGraph -Scope Sites.FullControl.All -UseDeviceCode
 
New-MgSitePermission -SiteId $spoSiteId -Roles $appRole -GrantedToIdentities @{ Application = $application }
