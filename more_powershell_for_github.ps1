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

function Add-GitHubCollaborator {



param ($header,$Credential, $Repository, $Collaborator)


Get-AuthHeader -Credential $Credential
#https://api.github.com/repos/octocat/hello-world/collaborators
#https://api.github.com/repos/octocat/hello-world/collaborators/USERNAME \

$global:api = "https://api.github.com/repos/$Credential/$Repository/collaborators/$Collaborator/s115345@ap.be"
#body aanmaken voor variablen
$Body = 
@{  repo =     $Repository;

    username = $Collaborator;

    owner =    $Credential;

} | ConvertTo-Json

#headers toevoegen  en ook de uri
Invoke-RestMethod -Method Put -Headers $header -uri $api   
#PUT method is call when you have to modify a single resource
$repo = New-GitHubRepository `
-RepositoryName test-morePS4Github
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
    