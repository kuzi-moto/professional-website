---
title: "Managing Active Directory With PowerShell"
date: 2020-05-29T12:39:25-05:00
draft: true
---

`<intro here>`

## Commands

```PowerShell
Get-ADUser -Identity name -Properties *                     # Get user + properties. TODO: List of useful properties to have
Get-ADPrincipalGroupMembership username | select name       # Get user groups
# Get groups and filter. TODO list of useful categories to filter on
Get-ADGroup -Filter 'GroupCategory -eq "Security" -and GroupScope -ne "DomainLocal"'
Get-ADGroup 'VPN_US_R&D' | Add-ADGroupMember -Members 'user' # Add user to specified group
Get-ADUser 'user' | Set-ADUser -Add @{extensionAttribute10='...'}
```
