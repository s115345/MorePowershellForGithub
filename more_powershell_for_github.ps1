function Get-AuthHeader{
    
    param($Credentials)
    $Base64Token = [System.Convert]::ToBase64String([char[]]$Token);
    $headers = 
    @{
        Authorization = 'Basic {0}' -f $Base64Token;
        
    }
    }