param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$SkuId
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

# Get the user
$user = Get-MgUser -UserId $UserPrincipalName

# Assign the license
Set-MgUserLicense -UserId $user.Id `
    -AddLicenses @{SkuId = $SkuId} `
    -RemoveLicenses @()
