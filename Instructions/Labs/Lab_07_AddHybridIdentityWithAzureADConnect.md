---
lab:
    title: '07 - Add Hybrid Identity with Azure AD Connect'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'  Retired
---

# Lab 07: Add Hybrid Identity with Azure AD Connect

**Note** - This lab requires an Azure Pass. Please see lab 00 for directions.

**Note 2** - We are fully removing this lab for the next month while we define a better and more straight-forward lab for the students.

## Lab scenario

Your company works has Active Directory Domain Services on-premises.  They would like to continue to use on-premises Active Directory as their identity and access management solution, but also require the ability for users to access cloud applications with the same username and password.

#### Estimated time: 60 minutes

### Exercise 1 - Setup On-Premises infrastructure

#### Task 1 - Create the on-premises Active Directory infrastructure

1. Deployment template can be accessed at this link: [On-Premises Test Lab Guide](https://github.com/maxskunkworks/TLG/tree/master/tlg-base-config_3-vm).

    **Note to learners and MCTs** - The deployment of this template can take 30-60 minutes, so be ready to take a break at this step or run the deployment before a lecture section of the course.

    **Note to Lab providers** - If possible, it would be helpful to students to complete and deploy as part of the lab environment setup.

2. On the **TLG (Test Lab Guide) - 3 VM Base Configuration (v1.0)** page, select **Deploy to Azure**.

   **Note** - The 3 VM Base Configuration provisions a Windows Server 2016 Active Directory domain controller named DC1 using the domain name you specify, and a domain member server named APP1 running Windows Server 2016. It also offers an option to provision a client VM running Windows 10, however we will not be using it in our lab (primarily due to licensing requirements applicable when running Windows 10 VMs in Azure). The domain member server (APP1) has automatically installed .NET 4.5 and IIS.  
   
   **Note** - The VM that is required for this lab is **DC1**.  If you are using an Azure Pass, there is a limitation of 2 VMs, so the Client VM may fail.  This is not needed for this lab.

3. On the **Custom deployment** page, specify the following settings, then select **Review + Create** then **Create**.

   -   Subscription: The name of the target Azure subscription where you want to provision the lab environment Azure VMs.
   -   Resource group: (Create new) **hybrididentity-RG**
   -   Location: The name of the Azure region that will host the lab environment Azure VMs.
   -   Config Name: **TlgBaseConfig-01**
   -   Domain Name: **corp.contoso.com**
   -   Server OS: **2016-Datacenter**
   -   Admin Username: **demouser**
   -   Admin Password: **demo@pass123**
      - **It is strongly recommended that you enter a secure password that you know and can remember.**
   -   Deploy Client VM: **No**
   -   Client VHD URI: **leave blank**
   -   VM Size: **Standard_D2s_v3**
   
   **Note** - Use a similar VM size if your subscription does not support the listed size. Documentation is linked here: <https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes>.

   -   DNS Label Prefix: **Any valid, globally unique DNS name (a unique string consisting of letters, digits, and hyphens, starting with a letter and up to 47 characters long).**

   -   _artifacts Location: **Accept the default**
   -   _artifacts Location Sas Token: **leave blank**

4. Select **Review + Create**.

5. After validation has passed, select **Create**.
    
6. Wait for the deployment to complete. This might take about 60 minutes.


### Task 2 - Configure the lab environment Azure VMs

1. In the browser window displaying the Azure portal, navigate to the **DC1** Azure VM and connect to it via Remote Desktop. When prompted, sign in by using the following credentials:

   -   Username: **demouser**
   -   Password: **demo\@pass123**
      - **It is strongly recommended that you enter a secure password that you can remember.**

2.  Within the Remote Desktop session to **DC1**, start **Windows PowerShell ISE**, add the following script to the script pane, and run it to disable Internet Explorer enhanced security configuration and User Access Control on both **DC1** and **APP1** Azure VMs:

    ```pwsh

    $vmNames = @('dc1','app1')
    Invoke-Command -ComputerName $vmNames {Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0}
    Invoke-Command -ComputerName $vmNames {Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value 0}
    Invoke-Command -ComputerName $vmNames {Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 00000000}
    ```

    **Note:** To run multiple PowerShell scripts in the same file, you can highlight a specific script and select **Run Selection** next to the green play button. 

3.  Within the **Windows PowerShell ISE** window  add the following script to the script pane, and run it to install Remote Server Administration Tools on both **DC1* and **APP1** Azure VMs:

    ```pwsh

    $vmNames = @('dc1','app1')
    Invoke-Command -ComputerName $vmNames {Install-WindowsFeature RSAT -IncludeAllSubFeature} 
    ```

4.  Within the **Windows PowerShell ISE** window  add the following script to the script pane, and run it to enable TLS 1.2 on both **DC1* and **APP1** Azure VMs:

    ```pwsh

    $vmNames = @('dc1','app1')
    Invoke-Command -ComputerName $vmNames {New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -Force}
    Invoke-Command -ComputerName $vmNames {New-Item 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -Force}
    Invoke-Command -ComputerName $vmNames {New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'Enabled' -value 1 –PropertyType DWORD}
    Invoke-Command -ComputerName $vmNames {New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Client' -name 'DisabledByDefault' -value 0 –PropertyType DWORD}
    Invoke-Command -ComputerName $vmNames {New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'Enabled' -value 1 –PropertyType DWORD}
    Invoke-Command -ComputerName $vmNames {New-ItemProperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS 1.2\Server' -name 'DisabledByDefault' -value 0 –PropertyType DWORD}
    Invoke-Command -ComputerName $vmNames {New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319' -name 'SchUseStrongCrypto' -value 1 –PropertyType DWORD}
    ```

5.  Within the **Windows PowerShell ISE** window  add the following script to the script pane, and run it to configure Windows Integrated Authentication on the Default Web Site hosted on the **APP1** Azure VM:

    ```pwsh

    $vmNames = @('app1')
    Invoke-Command -ComputerName $vmNames {Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication}
    Invoke-Command -ComputerName $vmNames {Set-WebConfigurationProperty -Filter "/system.webServer/security/authentication/anonymousAuthentication" -Name Enabled -Value False -PSPath IIS:\ -Location "Default Web Site"}
    Invoke-Command -ComputerName $vmNames {Set-WebConfigurationProperty -Filter "/system.webServer/security/authentication/windowsAuthentication" -Name Enabled -Value True -PSPath IIS:\ -Location "Default Web Site"}
    ```

### Task 3 - Restart the Azure VMs

1. Within the **Windows PowerShell ISE** window, from the console pane, run the following to restart **APP1**:

    ```pwsh

    Restart-Computer -ComputerName 'APP1'
    ```

2. Within the **Windows PowerShell ISE** window, from the console pane, run the following to restart **DC1**:

    ```pwsh
    Restart-Computer -ComputerName 'DC1'
    ```

### Task 5 - Configure contoso.local Active Directory

1. Connect again to the **DC1** Azure VM via Remote Desktop. When prompted, sign in by using the following credentials:

    -   Username: **demouser**

    -   Password: **demo\@pass123**
       - **It is strongly recommended that you enter a secure password that you can remember.**

2.  Within the Remote Desktop session to **DC1**, start Internet Explorer and navigate to the link below.

    ```
    https://github.com/microsoft/MCW-Hybrid-identity/tree/main/Hands-on%20lab/studentfiles
    ```

3. On the **Create Users/Group for Active Directory Demo/Test Environment** page, select the **CreateDemoUsers.ps1** link, accept the licensing terms, and save the corresponding script to the local file system.

4. On the **Create Users/Group for Active Directory Demo/Test Environment** page, select the **CreateDemoUsers.csv** link (directly above the PowerShell code section) and save the corresponding csv file to the same location as the **CreateDemoUsers.ps1** file.

5. Within the Remote Desktop session to **DC1**, start File Explorer, navigate to the folder where you downloaded both files, right-Select on the file **CreateDemoUsers.ps1**, select **Properties**, in the **CreateDemoUsers.ps1 Properties** dialog box, check the **Unblock** checkbox and select **OK**.

6. Within the File Explorer window, right-Select on the file **CreateDemoUsers.ps1** again and select **Edit**. 

7. In the **Administrator: Windows PowerShell ISE** window, change line **148** from:

    ```pwsh
    $UserCount = 1000 #Up to 2500 can be created
    ```

   to
    ```pwsh
    $UserCount = 2500 #Up to 2500 can be created
    ```

8. In the **Windows PowerShell ISE** window, save the change and run the **CreateDemoUsers.ps1** script to create a lab environment organizational unit hierarchy and populate it with test user accounts. 

9.  Within the **Windows PowerShell ISE** window, add the following script to the script pane, and run it to modify settings of the AD user accounts you will use in this lab:

    ```pwsh

    $adUser1 = Get-ADUser -Filter {samAccountName -eq "AGAyers"}
    $adUser1groups = $adUser1 | Get-ADPrincipalGroupMembership 
    $adUser1groups | foreach { if ($_.name -ne 'Domain Users') {Remove-ADPrincipalGroupMembership -MemberOf $_.name -Identity $adUser1.DistinguishedName} }
    Add-ADPrincipalGroupMembership -MemberOf 'Engineering' -Identity $adUser1.DistinguishedName
    Move-ADObject -Identity $adUser1.DistinguishedName -TargetPath 'OU=NJ,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com'

    Set-ADAccountPassword -Identity 'CN=Ayers\, Ann,OU=NJ,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com' -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "demo@pass123" -Force)

    $adUser2 = Get-ADUser -Filter {samAccountName -eq "TFBell"}
    $adUser2groups = $adUser2 | Get-ADPrincipalGroupMembership 
    $adUser2groups | foreach { if ($_.name -ne 'Domain Users') {Remove-ADPrincipalGroupMembership -MemberOf $_.name -Identity $adUser2.DistinguishedName} }
    Add-ADPrincipalGroupMembership -MemberOf 'Engineering' -Identity $adUser2.DistinguishedName
    Move-ADObject -Identity $adUser2.DistinguishedName -TargetPath 'OU=VT,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com'

    Set-ADAccountPassword -Identity 'CN=Bell\, Teresa,OU=VT,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com' -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "demo@pass123" -Force)
    Get-ADGroup -Identity 'Domain Admins' | Add-ADGroupMember -Members 'CN=Ayers\, Ann,OU=NJ,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com'
    Get-ADGroup -Identity 'Enterprise Admins' | Add-ADGroupMember -Members 'CN=Ayers\, Ann,OU=NJ,OU=US,OU=Users,OU=Demo Accounts,DC=corp,DC=contoso,DC=com'
    ```

10. Within the **Windows PowerShell ISE** window, add the following script to the script pane, and run it to create additional organizational units named **Servers** and **Clients** and move the **APP1** computer account to the first of them:

    ```pwsh

    New-ADOrganizationalUnit -Name 'Servers' -Path 'OU=Demo Accounts,DC=corp,DC=contoso,DC=com'
    New-ADOrganizationalUnit -Name 'Clients' -Path 'OU=Demo Accounts,DC=corp,DC=contoso,DC=com'

    Move-ADObject -Identity 'CN=APP1,CN=Computers,DC=corp,DC=contoso,DC=com' -TargetPath 'OU=Servers,OU=Demo Accounts,DC=corp,DC=contoso,DC=com'
    ```

11. Sign out from **DC1**.

## Exercise 2: Integrate an Active Directory forest with an Azure Active Directory tenant

### Task 1: Create an Azure Active Directory tenant and activate an EMS E5 trial

In this task, you will create an Azure Active Directory tenant with the following settings: 

-   Organization name: **Contoso**

-   Initial domain name: Any valid, unique domain name.

-   Country or region: **United States**

1. From the lab computer, start a new Web browser window and navigate to the Azure portal at <https://portal.azure.com> if you haven't already.

2. When prompted, sign into the Azure subscription into which you deployed resources in the Before Hands-On Lab exercises.

3. On the lab computer, in the Azure portal, select **+ Create a resource**.

4. On the **New** page, in the **Search the Marketplace** text box, type **Azure Active Directory** and, in the list of results, select **Azure Active Directory**.

5. On the **Azure Active Directory** page, select **Create**.

6. On the **Create directory** page, specify the following settings and select **Create**:

Basic tab:
    -   Select a tenant type: Choose **Azure Active Directory**

Configuration tab:
    -   Organization name: **Contoso**

    -   Initial domain name: Any valid, unique domain name.

    -   Country or region: **United States**

7. Once it's created, open **Azure Active Directory**.

8. On the Overview page choose **Manage tenant**.

9. Put a check in your newly created directory.

10. Choose **Switch** at the top of the page.

    >**Note**: It may take a few minutes for everything to display properly.

11. On the **Contoso - Overview** page, select **Users**.

12. Note that you only have a single ExternalAzureAD user in this new tenant.

### Task 2: Create and configure Azure AD user to administer this directory

1. From the lab computer, in the Azure portal, navigate back to the **Contoso - Overview** page.

2. On the **Contoso - Overview** page, select **Users** under **Manage** in the left navigation.

3. On the **Users - All users** page, select the entry representing your user account.

4. On the **Profile** page of your user account, select **Edit**.

5. In the **Settings** section, in the **Usage location** drop-down list, select the **United States** entry and select **Save**.

#### Create the new administrator

6. On the **New user** page, ensure that the **Create user** option is selected, specify the following settings, and select **Create**:

    - User name: **john.doe *@your Azure AD tenant domain name* ** where ***your Azure AD tenant domain name*** is the domain name you specified when creating the Contoso Azure AD tenant.

    - Name: **john.doe**

    - First name: **John**

    - Last name: **Doe**
    
    - Password: **Auto-generate password**
    
    - Show Password: **Enabled** then make sure to copy the password.

    - Groups: **0 group selected**
    
    - Roles: **Global Administrator**
    
    - Block sign in: **No**
    
    - Usage location: **United States**
    
    - Job title: **Leave blank**
    
    - Department: **Leave blank**

    > **Note**: Copy the **User name** and **Password** values into Notepad. You will need them later in this lab.


### Task 5: Configure DNS suffix in the Contoso Active Directory forest

In this task, you will configure the DNS suffix of the Contoso Active Directory forest to match the newly verified Azure AD custom domain name.

1. On the lab computer, in the Azure portal, verify that you are signed into the Azure AD tenant associated with the Azure subscription into which you deployed resources in the Before Hands-On Lab exercises (the **Default Directory**). If not, select the **Directory + Subscription** icon in the toolbar of the Azure portal (to the right of the **Cloud Shell** icon) to switch to that Azure AD tenant. 

2. In the Azure portal, navigate to the page of the **DC1** virtual machine.

3. On the **DC1** virtual machine page, connect to **DC1** via Remote Desktop. When prompted to sign in, use the **demouser** name and the **demo\@pass123** password. 

4. Within the Remote Desktop session to **DC1**, on the **Server Manager** window, start the **Active Directory Domains and Trusts** console under **Tools**. 

5. In the **Active Directory Domains and Trusts** console, right-Select **Active Directory Domains and Trusts [DC1.corp.contoso.com]** on the left and select **Properties**.

6. On the **UPN Suffixes** tab of the **Active Directory Domains and Trusts [DC1.corp.contoso.com]** window, in the **Alternative UPN suffixes** textbox, type the name of the custom domain you verified in the previous task, select **Add**, and then select **OK**.

7. Within the Remote Desktop session to **DC1**, on the **Server Manager** window, start the **Active Directory Users and Computers** console under **Tools**. 

8. In the **Active Directory Users and Computers** console, expand **corp.contoso.com** on the left and examine the organizational unit hierarchy of the domain and the group membership of the domain groups. 

9.  Within the Remote Desktop session to **DC1**, start Windows PowerShell ISE and, on the Script pane, run the following to replace the UPN suffix of all users who are members of the **Engineering** group with the one matching the custom verified domain name of the Contoso Azure AD tenant (replace the placeholder `<custom_domain_name>` with the actual name of the custom verified domain name you assigned to the Contoso Azure AD tenant). 

    ```pwsh
    $domainName = '<custom_domain_name>'
    $users = Get-ADGroupMember -Identity 'Engineering' -Recursive | Where-Object {$_.objectClass -eq 'user'}

    foreach ($user in $users) {
        $user = Get-ADUser -Identity $User.SamAccountName
        $userName = $user.UserPrincipalName.Split('@')[0] 
        $upn = $userName + "@" + $domainName 
        $user | Set-ADUser -UserPrincipalName $upn
    }
    ```

### Task 6: Install Azure AD Connect

In this task, you will install Azure AD Connect.

1. Within the Remote Desktop session to **DC1**, in Server Manager, select **Local Server**, and ensure that **IE Enhanced Security Configuration** is disabled. If not, then select the **On** link next to **IE Enhanced Security Configuration**, set the **Administrators** settings to **Off**, and select **OK**.

2. Within the Remote Desktop session to **DC1**, open the **Windows PowerShell ISE** window and run this command to install the Chrome browser.

    ```pwsh
    $LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
    ```

2. Within the Remote Desktop session to **DC1**, start the Chrome browser and navigate to the Azure portal at <https://portal.azure.com>.

3. When prompted to sign in, enter the credentials of the **john.doe** Azure AD user account, which you copied into Notepad earlier in this exercise.

4. When prompted, change the password for the **john.doe** user account. 
  
    > **Note**: If you receive the message **We've seen that password too many times before. Choose something harder to guess**, you'll need to modify the password until it is unique enough to be accepted.

5. If prompted whether to **Stay signed in?"** select **No**. You will be redirected to the Azure portal interface. 

6. If presented with the **Welcome to Microsoft Azure** dialog box, select **Maybe later**. 

7. In the Azure portal, select **Azure Active Directory** on the portal's left navigation to navigate to the **Contoso - Overview** page.

8. On the **Contoso - Overview** page, select **Azure AD Connect** under **Manage** on the left.

9.  On the **Azure AD Connect** page, select the **Download Azure AD Connect** link.  Then choose **Connect Sync** from the menu.

10. On the **Microsoft Azure Active Directory Connect** web page of the Microsoft Downloads site, select **Download**.

11. When prompted whether to run or save **AzureADConnect.msi**, select **Run**. This will download the file and automatically start the **Microsoft Azure Active Directory Connect** wizard. 

12. On the **Welcome to Azure AD Connect** page, check the **I agree to the license terms and privacy notice** box and select **Continue**.

13. On the **Express Settings** page, select the **Customize** button.

14. On the **Install required components** page, leave all optional configuration options deselected and select **Install**.

15. On the **User sign-in** page, select the **Pass-through authentication** option and the **Enable single sign-on** checkboxes, and select **Next**.

16. On the **Connect to Azure AD** page, sign in by using the credentials of the **john.doe** account and select **Next**.

17. On the **Connect your directories** page, ensure that the **corp.contoso.com** entry appears in the **FOREST** drop-down list and select **Add Directory**. In the **AD forest account**, ensure that the **Create new AD account** option is selected, in the **ENTERPRISE ADMIN USERNAME** textbox, type **CORP.CONTOSO.COM\\demouser**, in the **PASSWORD** textbox, type **demo\@pass123**, and select **OK**.


18. Back on the **Connect your directories** page, select **Next**.

19. On the **Azure AD sign-in configuration** page, ensure that your custom domain name is listed as the verified **Active Directory UPN Suffix**, and that the **userPrincipalName** entry appears in the **USER PRINCIPAL NAME** drop-down list. Note the warning stating **Users will not be able to sign into Azure AD with on-premises credentials if the UPN suffix does not match a verified domain name**. Check the **Continue without matching all UPN suffixes to verified domain** box and select **Next**. 

    >**Note**: This is expected, since some users are still configured with the **contoso.local** UPN suffix, which is not routable and cannot be configured as a verified custom domain name of an Azure AD tenant.

20. On the **Domain and OU filtering** page; choose **Sync selected domains and OUs** then ensure that only the **DemoAccounts** OU and all its children OUs are selected and select **Next**. 


21. On the **Uniquely identifying your users** page, accept the default settings and select **Next**. 


22. On the **Filter users and devices** page, accept the default settings and select **Next**. 

23. On the **Optional features** page, accept the default settings and select **Next**.

24. On the **Enable single sign-on** page, select **Enter credentials**, in the **Forest credentials** dialog box, sign in with the **CORP\\demouser** username and **demo\@pass123** password, and select **Next**.


25. On the **Ready to configure** page, ensure that the **Start the synchronization process when configuration completes** checkbox is **NOT** selected and select **Install**.


   > **Note**: You will configure attribute-level filtering before enabling the synchronization process.

   > **Note**: Installation should take about 2 minutes.

26. On the **Configuration complete** page, select **Exit**.


### Task 7: Enable Active Directory Recycle Bin

In this task, you will enable Recycle Bin in the Contoso Active Directory domain. 

1. Within the Remote Desktop session to **DC1**, on the Tools menu in the Server Manager console, start **Active Directory Administrative Center**.


2. In the **Active Directory Administrative Center** console, right-Select **corp (local)** on the left and select **Enable Recycle Bin**. When prompted to confirm, select **OK**.


3. When prompted to refresh AD Administrative Center, select **OK**.

   > **Note**: For information regarding benefits of the Recycle Bin in hybrid scenarios, refer to <https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-recycle-bin>

### Task 8: Configure Azure AD Connect attribute-level filtering

In this task, you will configure Azure AD Connect attribute level filtering that will limit synchronization of user accounts to those with the UPN suffix matching the custom domain name of the target Azure AD tenant.

   > **Note**: The positive filtering option requires at least two sync rules. One of them determines the correct scope of objects to synchronize. The second catch-all sync rule filters out all objects that have not yet been identified as an object that should be synchronized.

1. Within the Remote Desktop session to **DC1**, start **Synchronization Rules Editor** under **Azure AD Connect** in the Start menu.


2. In the Synchronization Rules Editor window, on the **View and manage your synchronization rules** page, ensure that **Inbound** appears in the **Direction** drop-down list and select **Add new rule**. This will launch the **Create inbound synchronization rule** wizard.


3. On the **Create inbound synchronization rule - Description** page, specify the following settings and select **Next**:

    - Name: **Custom In from AD - UPN Filter**

    - Description: **Custom Inbound Rule - includes users with UPN set to match the Azure AD custom domain**

    - Connected System: **corp.contoso.com**

    - Connected System Object Type: **user**

    - Metaverse Object Type: **person**

    - Link Type: **join**

    - Precedence: **50**

    - Tag: **Leave empty**

    - Enable Password Sync: **Leave empty**

    - Disabled: **Leave empty**


4. On the **Create inbound scoping filter** page, select **Add Group**, select **Add clause** specify the following, and select **Next**:

    - Attribute: **userPrincipalName**

    - Operator: **ENDSWITH**

    - Value: **\@\<your custom domain name>**

5. On the **Join Rules** page, select **Next**.

6. On the **Transformations** page, select **Add transformation** specify the following and select **Add**:

    - FlowType: **Constant**

    - Target Attribute: **cloudFiltered**

    - Source: **False**

7. When presented with a **Warning** dialog box displaying that message stating that **A full import and full synchronization will be run on 'corp.contoso.com' during your next synchronization cycle**, select **OK**.

   > **Note**: This should bring you back to the View and manage your synchronization rules interface, with the new rule listed at the top of the rule list. 

8. Back in the **Synchronization Rules Editor** window, on the **View and manage your synchronization rules** page, ensure that **Inbound** appears in the **Direction** drop-down list and select **Add new rule** again. This will launch the **Create inbound synchronization rule** wizard.

9. On the **Description** page, specify the following settings and select **Next**:

    - Name: **Custom In from AD - Catch-all Filter**

    - Description: **Custom Inbound Rule - excludes all users with UPN not set to match the Azure AD custom domain**

    - Connected System: **corp.contoso.com**

    - Connected System Object Type: **user**

    - Metaverse Object Type: **person**

    - Link Type: **join**

    - Precedence: **51**

    - Tag: **Leave empty**

    - Enable Password Sync: **Leave empty**

    - Disabled: **Leave empty**


10. On the **Scoping filer** page, select **Next**.

11. On the **Join Rules** page, select **Next**.

12. On the **Transformations** page, select **Add transformation** specify the following and select **Add**:

    - FlowType: **Constant**

    - Target Attribute: **cloudFiltered**

    - Source: **True**

13. When presented with a **Warning** dialog box displaying a message stating that **A full import and full synchronization will be run on 'corp.contoso.com' during your next synchronization cycle**, select **OK**.

    >**Note**: This should bring you back to the **View and manage your synchronization rules** interface, with the new rules listed at the top of the rule list. 

### Task 9: Initiate and verify directory synchronization

1. Within the Remote Desktop session to **DC1**, double-Select the **Azure AD Connect** desktop shortcut.

2. On the **Welcome to Azure AD Connect** page, select **Configure**. 

3. On the **Additional tasks** page, select **Customize synchronization options** and select **Next**.

4. On the **Connect to Azure AD** page, sign in by using the credentials of the **john.doe** account and select **Next**.

5. On the **Connect your directories** page, select **Next**.

6. On the **Domain and OU filtering** page, select **Next**. 

7. On the **Optional features** page, accept the default settings and select **Next**.

8. On the **Enable single sign-on** page, select **Next**.

9. On the **Ready to configure** page, select the **Start the synchronization process when configuration completes** checkbox and select **Configure**.

10. On the **Configuration complete** page, select **Exit**.

11. Within the Remote Desktop session to **DC1**, in the Edge browser window displaying the Azure portal, navigate to the **Users - All users** page of the Contoso Azure AD tenant.

12. On the **Users - All users** page, note that the list of user objects includes all user accounts with the UPN suffix matching the custom domain name of the Azure AD tenant. You may need to refresh the page or wait a few minutes to see the change.

13. In the Azure portal, navigate to the **Groups - All groups** page of the Contoso Azure AD tenant and note that all the corp.contoso.com domain groups have been synchronized as well. 

14. In the Azure portal, navigate to the **Contoso - Azure AD Connect** page and select **Azure AD Connect** on the left. Verify that the following settings are set: 

    - Azure AD Connect Sync Status: **Enabled** 
  
    - Last Sync: **This should be a timestamp of some sort**. 
  
    - Password Hash Sync: **Disabled** 
  
    - Federation: **Disabled**
   
    - Seamless single sign-on: **Enabled for 1 domain** 
  
    - Pass-through authentication: **Enabled with 1 agent**

   > **Note**: In a production environment, you would install additional agents for redundancy. For more information, refer to <https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta-quick-start>.

### Task 10: Configure Hybrid Azure AD join

In this task, you will configure Azure AD Connect device synchronization options.

1. Within the Remote Desktop session to **DC1**, double-Select the **Azure AD Connect** desktop shortcut.

2. On the **Welcome to Azure AD Connect** page, select **Configure**. 

3. On the **Additional tasks** page, select **Configure device options** and select **Next**.

4. On the **Overview** page, review the information regarding **Hybrid Azure AD join** and **Device writeback**, and select **Next**.

5. On the **Connect to Azure AD** page, sign in by using the credentials of the **john.doe** account and select **Next**.

6. On the **Device options** page, ensure that the **Configure Hybrid Azure AD join** option is selected and select **Next**. 

7. On the **Device operating system** page, select the **Windows 10 or later domain-joined devices** and **Supported Windows down-level domain-joined devices** checkboxes, and select **Next**. 

   > **Note**: Windows down-level devices are supported only if you are using Seamless SSO for managed domains or a federation service such as AD FS for federated domains.

8. On the **SCP configuration** page, check the **corp.contoso.com** Active Directory forest box, select the **Azure Active Directory** entry in the **Authentication Service** dropdown list, and select **Add**.

9. When prompted for Enterprise Admin Credentials for corp.contoso.com, in the **Windows Security** dialog box, sign in with the **CORP\\demouser** user name and **demo\@pass123** password.

10. Back on the **SCP configuration** page, select **Next**.

11. On the **Ready to configure** page, select **Configure**.

12. On the **Configuration complete** page verify that the task completed successfully and select **Exit**.


### Task 11: Perform Hybrid Azure AD join

1. On the lab computer, in the Azure portal, verify that you are signed into the Azure AD tenant associated with the Azure subscription into which you deployed resources in the Before Hands-On Lab exercises (the **Default directory**). If not, select the **Directory + Subscription** icon in the toolbar of the Azure portal (to the right of the **Cloud Shell** icon) to switch to that Azure AD tenant. 

2. In the Azure portal, navigate to the page of the **APP1** virtual machine.

3. On the **APP1** virtual machine page, connect to **APP1** via Remote Desktop. When prompted to sign in, use the **AGAyers\@<custom_domain_name>** user name with the **demo@pass123** password (where **<custom_domain_name>** placeholder represents the custom DNS domain name you assigned to the Contoso Azure AD tenant earlier in this exercise.

4. Within the Remote Desktop session to **APP1**, on the **Server Manager** window, start **Task Scheduler** under **Tools**. 


5. In the **Task Scheduler** console, navigate to **Task Scheduler Library** > **Microsoft** > **Windows** > **Workplace Join**. From there, enable then run the **Automatic-Device-Join** task. 


6. Switch to the Remote Desktop session to **DC1** and, from the console pane of the Windows PowerShell ISE window, start Azure AD Connect delta synchronization by running the following:

   ```pwsh
   Import-Module -Name 'C:\Program Files\Microsoft Azure AD Sync\Bin\ADSync\ADSync.psd1'
   
   Start-ADSyncSyncCycle -PolicyType Delta
   ```

7. Switch back to the Remote Desktop session to **APP1** and start a **Command Prompt**.

8. From the Command Prompt window, check the Azure AD registration status of APP1 by running the following: 

   ```
   dsregcmd /status
   ```

9. Verify that the output of the command resembles the following:

   ```
   +----------------------------------------------------------------------+
   | Device State                                                         |
   +----------------------------------------------------------------------+

        AzureAdJoined : YES
     EnterpriseJoined : NO
             DeviceId : 61eea2b8-efbe-43d9-b267-126433c8ee34
           Thumbprint : BBAAA0FB4A55E880388851BED955A2669A961A96
       KeyContainerId : 2eb75eb8-0a1d-437b-99d9-9dd161ca0d90
          KeyProvider : Microsoft Software Key Storage Provider
         TpmProtected : NO
         KeySignTest: : PASSED
                  Idp : login.windows.net
             TenantId : xxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxx
           TenantName : xxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxx
          AuthCodeUrl : https://login.microsoftonline.com/xxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxx/oauth2/authorize
       AccessTokenUrl : https://login.microsoftonline.com/xxxxxxx-xxxx-xxx-xxxx-xxxxxxxxxx/oauth2/token
               MdmUrl :
            MdmTouUrl :
     MdmComplianceUrl :
          SettingsUrl :
       JoinSrvVersion : 1.0
           JoinSrvUrl : https://enterpriseregistration.windows.net/EnrollmentServer/device/
            JoinSrvId : urn:ms-drs:enterpriseregistration.windows.net
        KeySrvVersion : 1.0
            KeySrvUrl : https://enterpriseregistration.windows.net/EnrollmentServer/key/
             KeySrvId : urn:ms-drs:enterpriseregistration.windows.net
         DomainJoined : YES
           DomainName : CORP

   +----------------------------------------------------------------------+
   | User State                                                           |
   +----------------------------------------------------------------------+

               NgcSet : NO
      WorkplaceJoined : NO
        WamDefaultSet : NO
           AzureAdPrt : NO

   +----------------------------------------------------------------------+
   | Ngc Prerequisite Check                                               |
   +----------------------------------------------------------------------+

        IsUserAzureAD : NO
        PolicyEnabled : NO
       DeviceEligible : YES
   SessionIsNotRemote : NO
     X509CertRequired : NO
         PreReqResult : WillNotProvision

   ```
11. Switch back to the Remote Desktop session to **DC1**, in the Edge browser window displaying the Azure portal, navigate to the **Devices - All devices** page of the Contoso Azure AD tenant and verify that there is an entry representing the APP1 server, with the **Join Type** set to **Hybrid Azure AD joined**.

   > **Note**: You might need to wait until the Azure AD registration status is correctly reported and its Azure AD object appears in the Azure portal.


