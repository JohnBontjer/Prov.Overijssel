$SiteUrl = "https://provincieoverijsselpilot.sharepoint.com/sites/KarelAppel"
$WhatIf = $true
# ------------------------------------------------------------------------------------------
$pnpModule = "SharePointPnPPowerShellOnline"
$mainlibrary = "C:\D_Drive\GitHub\Prometheus-Modules\Lib"

$modules = Get-ChildItem "$mainlibrary\PnP\$pnpModule"  -Filter *.psd1 -Recurse
foreach ($module in $modules) {
    Import-Module $modules.FullName
}

connect-pnponline -url $SiteUrl -Credentials "provincieoverijsselpilot.sharepoint.com"

# Get TargetItem / aka moved documentset
$DocumentLibrary = "Documenten"

$pnplist = Get-PnPList -Identity $DocumentLibrary
$listTypes = Get-PnPContentType -List $pnplist
# $contentTypeName = "Document" 
# $query = @"
# <View Scope="RecursiveAll"><Where>
# <Eq>
#   <FieldRef Name='ContentType'/>
#   <Value Type='Computed'>$contentTypeName</Value>
# </Eq>
# </Where></View>
# "@


#Retrieve all Files from the document library
$ListItems = Get-PnPListItem -List $DocumentLibrary -PageSize 1000 | Where-Object { $_["FileLeafRef"] -like "*.*" }
   
#Enumerate all list items to get file details
$AllFiles = @()
ForEach ($Item in $ListItems) {
    #Add file details to Result array
    $Object = [ordered] @{
        ID               = $Item.FieldValues["ID"]            
        FileName         = $Item.FieldValues["FileLeafRef"]            
        FileID           = $Item.FieldValues["UniqueId"]
        FileType         = $Item.FieldValues["File_x0020_Type"]
        RelativeURL      = $Item.FieldValues["FileRef"]
        Folder           = $Item.FieldValues["FileDirRef"]
        ContentTypeId    = $Item.FieldValues["ContentTypeId"].StringValue
        CreatedByEmail   = $Item.FieldValues["Author"].Email
        Author           = $Item.FieldValues["Author"]
        CreatedTime      = $Item.FieldValues["Created"]
        LastModifiedTime = $Item.FieldValues["Modified"]
        ModifiedByEmail  = $Item.FieldValues["Editor"].Email
        Editor           = $Item.FieldValues["Editor"]
        FileSize_KB      = [Math]::Round(($Item.FieldValues["File_x0020_Size"] / 1024), 2) #File size in KB
    }

    $AllFiles += $Object
 
}

$userEmail = "e.herle@ProvincieOverijsselPilot.onmicrosoft.com"
$allFiltered = $AllFiles | Where-Object { $_.ModifiedByEmail -like $userEmail }
write-host "Found $($allFiltered.Count) items" 

$allFiltered = $allFiltered | Where-Object { $_.ContentTypeId -like "0x0101*" }

# $items = Get-PnPListItem -List $pnplist -Query $query
write-host "Found $($allFiltered.Count) items" 

$FileRef = $null
foreach ($item in $allFiltered) {
    
    $FieldArray = @{ }
    write-host $("Title           : {0}" -f $item.FileName)
    write-host $("Folder          : {0}" -f $item.Folder)
    write-host $("ModifiedByEmail : {0}" -f $item.ModifiedByEmail)
    write-host $("CreatedByEmail  : {0}" -f $item.CreatedByEmail)
    write-host $(" ------------------------------------- -------------------------------------")

    # Gewijzigd en gemaakt door ophalen van $SourceDocumentSet
    $Editor = $item.Editor.LookupValue;
    $Author = $item.Author.LookupValue

    if ($null -eq $FileRef) {
        $FileRef = $item.Folder
    }
    else {
        if ($FileRef -ne $item.Folder) {
            Exit
        }
        else {
            write-host $item.Folder
        }
    }

    # Overwrite (reuse) Created and Modified dates
    if (!$FieldArray.Created) { $FieldArray.Add("Created", $item.CreatedTime) } 
    if (!$FieldArray.Modified) { $FieldArray.Add("Modified", $item.LastModifiedTime) }

    if (!$FieldArray.Editor) { $FieldArray.Add("Editor", $Editor) } 
    if (!$FieldArray.Author) { $FieldArray.Add("Author", $Author) }
                
    $FieldArray.Add("Bijvoegen", 1)
    $WhatIf = $false
    # First update to NewContentType
    $targetItem = Get-PnPListItem -id $item.id -list $DocumentLibrary
    if (!$WhatIf) {
        # Get current context
        $context = Get-PnPContext
        $context.load($targetItem)
        $context.ExecuteQuery()
                    
        $newItem = Set-PnPListItem -List $PnPList -Identity $targetItem.id -Values $FieldArray
    }
    else { 
        Write-Host "`tPerforming the operation Set-PnPListItem on item '$DisplayName' [$($targetItem.id)]" -foregroundcolor cyan

    } 
}

write-host " --------------------------------------------" -ForegroundColor Green
write-host " DONE" -ForegroundColor Green
write-host " --------------------------------------------" -ForegroundColor Green

