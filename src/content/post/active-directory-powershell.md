---
title: "Managing Active Directory With PowerShell"
date: 2020-05-29T12:39:25-05:00
draft: true
---

`<intro here>`

## Commands

```PowerShell
# Get a user + additional properties. TODO: List of useful properties to have
# LockedOut
Get-ADUser -Identity name -Properties *

# Get disabled accounts
Search-ADAccount -AccountDisabled

# Get locked-out accounts
Search-ADAccount -LockedOut

# Get user groups
Get-ADPrincipalGroupMembership username | select name

# Get groups and filter. TODO list of useful categories to filter on
Get-ADGroup -Filter 'GroupCategory -eq "Security"'

# Add user to specified group
Get-ADGroup 'VPN_US_R&D' | Add-ADGroupMember -Members 'user'

# Set an arbitrary attribute on a user
Get-ADUser 'user' | Set-ADUser -Add @{extensionAttribute10='...'}
```
