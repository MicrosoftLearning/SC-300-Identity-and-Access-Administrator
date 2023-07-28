---
lab:
    title: '10 - Azure AD Authentication for Windows and Linux Virtual Machines'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 10 - Azure AD Authentication for Windows and Linux Virtual Machines

**Note** - This lab requires an Azure Pass. Please see lab 00 for directions.

## Lab scenario

The company has decided that Azure Active Directory should be used to login to virtual machines for remote access.  This lab will show how this can be setup for Windows and Linux virtual machines.

#### Estimated time: 30 minutes

### Exercise 1 - Login to Windows Virtual Machines in Azure with Azure AD

#### Task 1 - Create a Windows Virtual Machine with Azure AD login enabled

1. Browse to the [https://portal.azure.com](https://portal.azure.com)

1. Select **+ Create a resource**.

1. Type **Windows Server** in Search the Marketplace search bar.

1. Select **Windows Server** and choose **Windows Server 2022 Datacenter** from Select a software plan dropdown.

1. You will have to create an administrator username and password for the VM on the basics tab.
   - Use a username you will remember and a secure password.

1. On the **Management** tab, check the box to Login with Azure AD under the Azure AD section.

1. You will notice that the **System assigned managed identity** under the Identity section is auto-matically checked and turned grey. This action should happen automatically once you enable Login with Azure AD.

1. Go through the rest of the experience of creating a virtual machine. 

1. Select Create.

#### Task 2 - Azure AD login for existing Azure Virtual Machines

1. Browse to **Virtual Machines** in the [https://portal.azure.com](https://portal.azure.com).

1. Select **Access control (IAM)**.

1. Select **+ Add**, then **Add role assignment** to open the Add role assignment page.

1. Assign the following settings:
    - **Assignment type**: Job function roles
    - **Role**: Virtual Machine Administrator Login
    - **Members**: Choose User, group, or service principal.  Then use **+ Select members** to add **Joni Sherman** as a specific user for the VM.

1. Select **Review + assign** to complete the process

#### Task 3 - Update the Server VM to support the Azure AD login

1. Select the **Connect** menu item.

1. On the **RDP** tab select the **Download RDP File**.  If prompted choose the **Keep** option for the file.  It will be saved into your Downloads folder.

1. Open the **Downloads** folder in File Manager.

1. Open the RDP.

1. Choose to log in as Alternate User.

1. Use the Admin username and Password you create when setting up the virtual machine.
   - If prompted, say yes to allow access to the virtual machine or RDP session.

1. Wait for the server is open and all the software to load, like the Server Manager Dashboard.

1. Select the **Start button** in the virtual machine.

1. Type **Control Panel** and launch the control panel app.

1. Select **System and Security** from the list of settings.

1. From the **System** setting, select the **Allow remote access** option.

1. At the bottom of the dialog box that opens you will see a **Remote Desktop** section.

1. **Uncheck** the box labeled **Allow connections only from computers running Remote Desktop with Network Level Authentication**.

1. Select **Apply** and then **OK**.

1. **Exit** the virtual machine RDP session.


#### Task 4 - Modify your RDP file to support the Azure AD login

1. Open the **Downloads** folder in file manager.

1. **Make a copy** of the RDP file and add **-AzureAD** to the end of the filename.

1. Edit the new version of the RDP file you just copied using Notepad. Add the these two lines of text to the bottom of the of the file:
     ```
        enablecredsspsupport:i:0
        authentication level:i:2
     ```
 
 1. **Save** the RDP file.  You should now have two versions of the file:
      - <<virtual machine name>>.RDP
      - <<virtual machine name>>-AzureAD.RDP

#### Task 5 - Connect to the Windows Server 2022 Datacenter using Azure AD login

1. Open the **<<virtual machine name>>-AzureAD.RDP

1. Select **Connect** when the dialog opens.

1. Instead of getting prompted on what User Account to log in with, you should get a message prompting on whether you want to connect to the remote computer.

1. Select **Yes** from the bottom of the screen.

1. The Remote Desktop session should open; and show the Windows Server login screen.  **Other User** with an OK button should be displayed.

1. Select **OK**.

1. In the login dialog enter the following information:
   - Username = **AzureAD\JoniS@<<your lab domainname>>
   - Password = Enter the password provided by your lab provider

   NOTE: JoniS is the user we granted access to log in as administrator during Task 1.

1. Windows Server should confirm the login and open to the normal Server Manager Dashboard.

#### Task 6 -- Optional testing to explore the Azure AD login

1. Check to see that JoniS was the only user added to the Administrators group.

1. From the Server Manager Dashboard, select the **Tools** menu in the upper left.

1. Launch the **Computer Management** tool.

1. Open **Local Users and Groups** then navigate to **Groups, Administrators**.

1. You should see **Azure\JoniSherman....** in the list.

1. Check to see if other Azure AD members can log in.

1. Exit out of the remote desktop session.

1. Launch the **<<server name>>-AzureAD.RDP** file again.

1. Try to log in as other Azure AD members like AdeleV or AlexW or DiegoS.

1. You should notice that each of these users are denied access.

### Optional Exercise 2 - Login to Linux Virtual Machines in Azure with Azure AD

#### Task 1 - Create a Linux VM with system assigned managed identity

1. Browse to the [https://portal.azure.com](https://portal.azure.com)

1. Select **+ Create a resource**.

1. Select on **Create** under **Ubuntu Server 18.04 LTS** in the Popular view.

1. On the **Management** tab, check the box to enable **Login with Azure Active Directory (Preview)**.

1. Ensure **System assigned managed identity** is checked.

1. Go through the rest of the experience of creating a virtual machine. During this preview, you’ll have to create an administrator account with username and password or SSH public key.

#### Task 2 - Azure AD login for existing Azure Virtual Machines

1. Browse to **Virtual Machines** in the [https://portal.azure.com](https://portal.azure.com).

1. Select **Access control (IAM)**.

1. Select Add > Add role assignment to open the Add role assignment page.

1. Assign the following role. 
    - **Role**: Virtual Machine Administrator Login or Virtual Machine User Login
    - **Assign access to**: User, group, service principal, or managed identity

1. For detailed steps, see Assign Azure roles using the Azure portal.
