function Get-AuthHeader{
    
 param($Credentials)
 
    $Credential = Read-Host -Prompt ’login’


    $access_token = Read-Host -AsSecureString -Prompt ’token’ |
    
    ConvertFrom-SecureString |
    Tee-Object ./secret.txt |
    ConvertTo-SecureString
    $creds = New-Object pscredential 'user’, $access_token
    Set-GitHubAuthentication -SessionOnly `
    -Credential $creds

    $Encoding= [System.Convert]::ToBase64String([char[]]$Creds.GetNetworkCredential().Password)
    $global:api = "https://api.github.com/user"
    $global:headers = 
    @{
        Authorization = "Basic $Encoding"; 
        return = $headers
        };
    

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
    