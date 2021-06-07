Read-Host -AsSecureString -Prompt ’token’ | # Secure string
#prompt gebruiker invullen token

ConvertFrom-SecureString | #convert secure string

#redirect output
Tee-Object ./secret.txt | 
ConvertTo-SecureString #Nadat het SecureString-object is gemaakt, kan het PSCredential-object worden gemaakt 

$creds = New-Object pscredential 'user’, $ss_token

Set-GitHubAuthentication -SessionOnly #SessionOnly cokies`
-Credential $creds

$Base64Token = [System.Convert]::ToBase64String([char[]]$creds.GetNetworkCredential().Password)
##base64 encoded string geven
#string encodedStr = Convert.ToBase64String(Encoding.UTF8.GetBytes("inputStr"));
$api = "https://api.github.com/user"


#De header van het HTTP-autorisatieverzoek bevat de referenties om een
# ​​user-agent bij een server te verifiëren.
$headers = 
@{

    Authorization = 'Basic {0}' -f $Base64Token; 
};


    #body variable kies output mode
$Body = 
@{
    location = 'Antwerpen';

    company = 'AP Hogeschool';
} | ConvertTo-Json



Invoke-RestMethod -Headers $headers -Uri https://api.github.com/user -body $Body -Method Post # POST is always for creating a resource
Get-GitHubUser -Current #current user laten zien
#PATCH is always for update a resource.