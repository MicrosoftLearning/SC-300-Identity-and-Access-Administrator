---
lab:
    title: '16 - Using Azure Key Vault for Managed Identities'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 16 - Using Azure Key Vault for Managed Identities

## Lab scenario

When you use managed identities for Azure resources, your code can get access tokens to authenticate to resources that support Azure AD authentication.  However, not all Azure services support Azure AD authentication. To use managed identities for Azure resources with those services, store the service credentials in Azure Key Vault, and use the managed identity to access Key Vault to retrieve the credentials.

#### Estimated time: 20 minutes

### Exercise 1 - Use Azure Key Vault to manage Virtual Machine identities

#### Task 1 - Create a Key Vault

1. Sign in to the [https://portal.azure.com]( https://portal.azure.com) using a Global administrator account.

1. At the top of the left navigation bar, select Create a resource

1. In the Search the Marketplace box type in **Key Vault**.  

1. Select **Key Vault** from the results.

1. Select **Create**.

1. Provide a Name for the new **Key Vault**.

1. Fill out all required information. Make sure that you choose the subscription and resource group that you're using for this tutorial.

1. Select **Review + create**.

1. Select **Create**.


#### Task 2 - Create a secret

1. Navigate to your newly created Key Vault.

1. Select **Secrets**, and select **Add**.

1. Select **Generate/Import**.

1. In the Create a secret screen, from Upload options leave Manual selected.

1. Enter a name and value for the secret.  The value can be anything you want. 

1. Leave the activation date and expiration date clear, and leave Enabled as Yes. 

1. Select **Create** to create the secret.

#### Task 3 - Grand access to Key Vault

1. Navigate to your newly created Key Vault

1. Select **Access Policy** from the menu on the left side.

1. Select **Add Access Policy**.

1. In the Add access policy section, under Configure from template (optional), choose Secret Management from the pull-down menu.

1. Choose **Select Principal**, and in the search field enter the name of the VM you created earlier.  Select the VM in the result list and choose Select.

1. Select **Add**.

1. Select **Save**.

#### Task 4 - Access data with Key Vault secret with PowerShell

1. In the lab virtual machine, open PowerShell.  

1. In PowerShell, invoke the web request on the tenant to get the token for the local host in the specific port for the VM.  

    ```
    $Response = Invoke-RestMethod -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fvault.azure.net' -Method GET -Headers @{Metadata="true"}
    ```

1. Next, extract the access token from the response.  

    ```
    $KeyVaultToken = $Response.access_token
    ```

1. Use PowerShell’s Invoke-WebRequest command to retrieve the secret you created earlier in the Key Vault, passing the access token in the Authorization header.  You’ll need the URL of your Key Vault, which is in the Essentials section of the Overview page of the Key Vault.  

    ```
    Invoke-RestMethod -Uri https://<your-key-vault-URL>/secrets/<secret-name>?api-version=2016-10-01 -Method GET -Headers @{Authorization="Bearer $KeyVaultToken"}
    ```
1. You should receive a response that looks like the following: 
    ```
    'My Secret' https://mi-lab-vault.vault.azure.net/secrets/mi-test/50644e90b13249b584c44b9f712f2e51 @{enabled=True; created=16…
    ```
1. This secret can be used to authenticate to services that require a name and password.