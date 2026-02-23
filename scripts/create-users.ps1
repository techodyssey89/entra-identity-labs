Connect-MgGraph -Scopes "User.ReadWrite.All"

New-MgUser -DisplayName "Adele Vance" `
  -UserPrincipalName "AdeleV@yourtenant.onmicrosoft.com" `
  -MailNickname "AdeleV" `
  -PasswordProfile @{ Password = "P@ssw0rd123!" } `
  -AccountEnabled $true
