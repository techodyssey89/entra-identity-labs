targetScope = 'tenant'

@description('Name of the group to create')
param groupName string = 'Lab-Users'

@description('Description for the group')
param groupDescription string = 'Group for Microsoft Entra basic user management lab'

resource labGroup 'Microsoft.Graph/groups@1.0.0' = {
  displayName: groupName
  description: groupDescription
  mailEnabled: false
  mailNickname: toLower(replace(groupName, ' ', ''))
  securityEnabled: true
}

@description('Role definition ID for User Administrator')
param userAdminRoleId string = 'fe930be7-5e62-47db-91af-98c3a49a38b1'

@description('Object ID of the admin who will receive the role')
param adminObjectId string

resource roleAssignment 'Microsoft.Graph/roleManagement/directory/roleAssignments@1.0.0' = {
  principalId: adminObjectId
  roleDefinitionId: userAdminRoleId
  directoryScopeId: '/'
}
