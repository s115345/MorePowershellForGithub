$Token ='s115455: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'
$Base64Token = [System.Convert]::ToBase64String([char[]]$Token);
#base64 encoded string geven
#string encodedStr = Convert.ToBase64String(Encoding.UTF8.GetBytes("inputStr"));


#simple authentication scheme built into the HTTP protocol. The client sends 
#HTTP requests with the Authorization header that contains the word Basic, followed
# by a space and a base64-encoded(non-encrypted) string username: password

$Headers = @{
#De header van het HTTP-autorisatieverzoek bevat de referenties om een
# ​​user-agent bij een server te verifiëren.
    Authorization = 'Basic {0}' -f $Base64Token; # -f [string]::Format(<a>, <b>)
    };

    #body variable kies output mode
$Body = @{
    Company = 'Ap Hogeschool-antwerpen';
    } | ConvertTo-Json;


Invoke-RestMethod -Headers $Headers -Uri "https://api.github.com/user" -Body $Body -Method Patch
#De Invoke-RestMethod-cmdlet verzendt HTTP- en HTTPS-verzoeken naar Representational State Transfer
# (REST) webservices die rijk gestructureerde gegevens retourneren.