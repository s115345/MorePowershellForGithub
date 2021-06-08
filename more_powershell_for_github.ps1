﻿function Get-AuthHeader{
    
 param($Credentials)

 Read-Host -AsSecureString -Prompt ’token’ |
 ConvertFrom-SecureString |
 Tee-Object ./secret.txt |
 ConvertTo-SecureString
 $creds = New-Object pscredential 'user’, $ss_token
 Set-GitHubAuthentication -SessionOnly `
 -Credential $creds
 $Authorisatie = [System.Convert]::ToBase64String([char[]]$Creds.GetNetworkCredential().Password)
 $api = "https://api.github.com/user"
 $headers = 
    @{
        Authorization = 'Basic $Authorisatie'; };
        return $headers
        
    

    Invoke-RestMethod -Headers $headers -Uri $api
    }

#Read-Host -AsSecureString -Prompt ’token’ |
#ConvertFrom-SecureString |
#Tee-Object ./secret.txt |
#ConvertTo-SecureString
#$creds = New-Object pscredential 'user’, $ss_token
#Set-GitHubAuthentication -SessionOnly `
#-Credential $creds
#$api = "https://api.github.com/user"
#Invoke-RestMethod -Headers $headers -Uri $api
    