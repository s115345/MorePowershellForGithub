Read-Host -AsSecureString -Prompt ’token’ |
ConvertFrom-SecureString | 

#converts a secure string (System.Security.SecureString) into an encrypted standard string
#Unlike a secure string, an encrypted standard string can be saved in a file for later use. 

Tee-Object .\secret.txt | 

#The Tee-Object cmdlet redirects output, that is, it sends the output of a command 
#in two directions (like the letter T). It stores the output in a file or variable 
#and also sends it down the pipeline. If Tee-Object is the last 
#command in the pipeline, the command output is displayed at the prompt.


ConvertTo-SecureString | #Converts plain text or encrypted strings to secure strings.Set-Variable ss_token#Nadat het SecureString-object is gemaakt, kan het PSCredential-object worden gemaakt$creds = New-Object pscredential 'user’, $ss_token
Set-GitHubAuthentication -SessionOnly `
-Credential $creds
Get-GitHubUser -Current #User die ingelogd is

#Get-Command -Module PowerShellForGitHub -Name *auth*
#Test of code werkt
#Test-GitHubAuthenticationConfigured =True

#nieuwe repository


Set-GitHubProfile -Company 'AP Hogeschool'
$repo = New-GitHubRepository `
-RepositoryName test-from-pwsh

