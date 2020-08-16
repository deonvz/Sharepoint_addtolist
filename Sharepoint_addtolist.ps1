# deon van Zyl
# This script imports entries to a sharepoint site`s list by using the add-committeelist function
Function Add-CommitteeList
{
    param( $CommitteeSite, $CommitteeList, $Committee, $Abbreviation, $Status, $Type, $Cluster, $SOeMail )
    
    Write-Host ("Committee List is: "+$CommitteeList+"; ")
    $List = $CommitteeSite.Lists[ $CommitteeList ]
    #$List = $CommitteeSite.Lists[ "Closed Committees" ]
    Write-Host( "Closed Committees List is :"+$List )
    #start adding records, mentioning each column
    $NewItem = $List.Items.Add()
    $NewItem[ "Name" ] = $Committee 
    $NewItem[ "Abbreviation" ] = $Abbreviation
    $NewItem[ "Committee Status" ] = $Status
    $NewItem[ "Committee Type" ] = $Type
    $NewItem[ "Cluster" ] = $Cluster
    $NewItem[ "Servicing Officer" ] = $SOeMail
    $NewItem.Update()
}
Add-PSSnapin Microsoft.SharePoint.PowerShell –erroraction SilentlyContinue
$Site = Get-SPWeb "https://somesite.com/"
#subsite , lib and list info
$CommitteeSite = Get-SPWeb "https://somesite.com/Committees"
$CommitteeLib = "Committees"
$CommitteeList = $CommitteeSite.Lists["Closed Committees"]
# The following below provides data for the list, ideally you can have it parse a file or another site via a webservice
Add-CommitteeList $CommitteeSite  $CommitteeList "TRAINING2_Training" "TRAINING2" "Active" "Closed" "None" "someone@test.com"
