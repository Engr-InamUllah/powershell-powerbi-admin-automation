[CmdletBinding()]
param([Parameter(Mandatory)][string]$AccessToken,[string]$OutputPath='output/workspaces.csv')
$headers=@{Authorization="Bearer $AccessToken"}
function Invoke-PagedPowerBIRequest([string]$Uri){
 $items=@();do{$response=Invoke-RestMethod -Uri $Uri -Headers $headers -Method Get;$items+=$response.value;$Uri=$response.'@odata.nextLink'}while($Uri);return $items
}
$workspaces=Invoke-PagedPowerBIRequest 'https://api.powerbi.com/v1.0/myorg/admin/groups?$top=5000'
$result=foreach($workspace in $workspaces){
 $refreshes=Invoke-PagedPowerBIRequest "https://api.powerbi.com/v1.0/myorg/groups/$($workspace.id)/datasets"
 [pscustomobject]@{WorkspaceId=$workspace.id;WorkspaceName=$workspace.name;State=$workspace.state;DatasetCount=@($refreshes).Count}
}
$folder=Split-Path $OutputPath;if($folder){New-Item -ItemType Directory -Force $folder|Out-Null};$result|Export-Csv $OutputPath -NoTypeInformation;$result