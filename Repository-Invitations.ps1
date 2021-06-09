function Accept-GitHubRepositoryInvitations {
    param($header, $ownerGroup, $repository,$maildomains)


    
    $invitation = Invoke-RestMethod -Method Get -Headers $header -Uri https://api.github.com/user/repository_invitation

    if (

        $ownergroup -eq $null -and $repository -eq $null -and $mailDomains -eq $null )
    {
        foreach ($invite in $invitation)

        {
            # #accept_repository_invitation(invitation_id, options = {}) ⇒ Boolean

            Write-Host  $invite

            $uri = 'https://api.github.com/user/repository_invitation/' + ($invite).id
            
            Invoke-RestMethod -Method Patch -Headers $header -Uri uri
            #hash data type
            #PATCH request is considered a set of instructions on how to modify a resource.
        } 
        
        
        if ($repository -ne $null -or $maildomains -ne $null -or $ownergroup -ne $null)
    {
        if ($repository -ne $null) 
        {
            foreach ($invite in $invitation)
            {
                $invitation_repository = $invite | Select-Object -Property repository
                #The Select-Object cmdlet selects specified properties of an object or set of objects. 

                if ($repository -eq ($invitation_repository.repository).name) #property gelijk zetten aan repository
                #zelfde naam repository 
                {
                    $uri = 'https://api.github.com/user/repository_invitations/'+ ($invite).id

                    Invoke-RestMethod -Method Patch -Headers $header -Uri $uri
                }
            }
    }


    }
     }
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     }