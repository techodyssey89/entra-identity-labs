$group = Get-MgGroup -Filter "displayName eq 'Lab-Users'"
$user = Get-MgUser -UserId "AdeleV@yourtenant.onmicrosoft.com"

New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $user.Id
