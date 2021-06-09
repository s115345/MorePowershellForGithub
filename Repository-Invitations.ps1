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
    }


    }