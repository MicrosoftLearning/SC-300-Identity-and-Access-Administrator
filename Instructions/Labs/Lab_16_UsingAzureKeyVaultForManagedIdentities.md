---
lab:
    title: '16 - Using Azure Key Vault for Managed Identities'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 16 - Using Azure Key Vault for Managed Identities

### Login type = Azure Resource login

## Lab scenario

When you use managed identities for Azure resources, your code can get access tokens to authenticate to resources that support Microsoft Entra authentication.  However, not all Azure services support Microsoft Entra authentication. To use managed identities for Azure resources with those services, store the service credentials in Azure Key Vault, and use the managed identity to access Key Vault to retrieve the credentials.

#### Estimated time: 35 minutes

### Exercise 1 - Use Azure Key Vault to manage Virtual Machine identities

#### Task 1 - Create a Key Vault

1. Sign in to the [https://portal.azure.com]( https://portal.azure.com) using a Global administrator account.

1. At the top of the left navigation bar, select **+ Create a resource**.

1. In the Search the Marketplace box type in **Key Vault**.  

1. Select **Key Vault** from the results.

1. Select **Create**.

1. Fill out all required information as shown below. Make sure that you choose the subscription that you're using for this lab.
    **Note** The Key vault name must be unique. Look for a green checkmark to the right of the field.

 - **Resource group** - rgSC300KeyVault
 - **Key vault name** - *anyuniquevalue*
 - On the **Access Configuration** page, select the **Vault Access Policy** radio button.
1. Select **Review + create**.

1. Select **Create**.

#### Task 2 - Create a Windows Virtual Machine

1. Select **+ Create a resource**.

1. Type **Windows 11** in Search the Marketplace search bar.

1. Select **Windows 11** and from the plan dropdown choose **Windows 11 Enterprise, version 22H2**. Then choose **Create**.

  | Field | Values |
  | :--   | :--    |
  | VM Name | vmKeyVault |
  | Availability options | No infrastructure redundancy required |
  | Admin Username | adminKeyVault |
  | Password | Set a secure password that you can remember |
  | Licensing | Confirm you have an eligible license |

1. Make sure you mark the **Confirm licensing** checkbox.

1. Use the **Next** button to get to the **Management** tab.

1. On the **Management** tab, check the box next to **Enable system assigned managed identity**.

1. Go through the rest of the experience of creating a virtual machine. 

1. Choose **Review + Create** then select **Create**.

#### Task 3 - Create a secret

1. Navigate to your newly created Key Vault.

1. Open **Objects** on the left menu then Select **Secrets**.

1. Select **+ Generate/Import**.

1. In the Create a secret screen, from Upload options leave **Manual** selected.

1. Enter a name and value for the secret.  The value can be anything you want. 

1. Leave the activation date and expiration date clear, and leave Enabled as Yes. 

1. Select **Create** to create the secret.

#### Task 4 - Grant access to Key Vault

1. Navigate to your newly created Key Vault

1. Select **Access Policies** from the menu on the left side.

1. Select **+ Create**.

1. In the Add access policy section, under Configure from template (optional), choose **Secret Management** from the pull-down menu.

1. Use the Next button to move to the **Principal** tab.

1. In the search field enter the name of the VM you created in task 2 - **vmKeyVault**.  Select the VM in the result list and choose Select.

1. Use the Next button to move to the **Review + Create** tab.

1. Select **Create**.

#### Task 5 - Access data with Key Vault secret with PowerShell

1. Go to **vmKeyVault** and use RDP to connect to your virtual machine as **adminKeyVault**.

1. Open the **Windows 11 virtual machine** deployed earlier in this lab. In the lab virtual machine, open PowerShell.  

1. In PowerShell, invoke the web request on the tenant to get the token for the local host in the specific port for the VM.  

    ```
    $Response = Invoke-RestMethod -Uri 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fvault.azure.net' -Method GET -Headers @{Metadata="true"}
    ```

1. Next, extract the access token from the response.  

    ```
    $KeyVaultToken = $Response.access_token
    ```

1. Use PowerShell’s Invoke-WebRequest command to retrieve the secret you created earlier in the Key Vault, passing the access token in the Authorization header.  You’ll need the URL of your Key Vault, which is in the Essentials section of the Overview page of the Key Vault.  Reminder - URI for Key Vault is on the Overview tab.

  - Key Vault URI -- get from Key Vaults Overview page in Azure Portal
  - Secrete Name -- get from Objects - Secrets page in the Key Vault

    ```
    Invoke-RestMethod -Uri https://<your-key-vault-URI>/secrets/<secret-name>?api-version=2016-10-01 -Method GET -Headers @{Authorization="Bearer $KeyVaultToken"}
    ```
1. You should receive a response that looks like the following: 
    ```
    'My Secret' https://mi-lab-vault.vault.azure.net/secrets/mi-test/50644e90b13249b584c44b9f712f2e51 @{enabled=True; created=16…
    ```
1. This secret can be used to authenticate to services that require a name and password.
