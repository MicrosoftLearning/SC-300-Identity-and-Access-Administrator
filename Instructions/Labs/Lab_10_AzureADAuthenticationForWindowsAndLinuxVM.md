---
lab:
  title: 10 - Microsoft Entra ID Authentication for Windows and Linux Virtual Machines
  learning path: '02'
  module: Module 02 - Implement an Authentication and Access Management Solution
  description: The company has decided that Microsoft Entra ID should be used to login to virtual machines for remote access.  This lab will show how this can be setup for Windows and Linux virtual machines.
  duration: 30 minutes
  level: 300
  islab: true
  primarytopics:
    - Microsoft Entra
    - Microsoft Entra ID
    - Windows
---

# Lab 10 - Microsoft Entra Authentication for Windows and Linux Virtual Machines

### Login type = Azure Resource login

## Lab scenario

The company has decided that Microsoft Entra ID should be used to login to virtual machines for remote access.  This lab will show how this can be setup for Windows and Linux virtual machines.

#### Estimated time: 30 minutes

### Exercise 1 - Login to Windows Virtual Machines in Azure with Microsoft Entra ID

#### Task 1 - Create a Windows Virtual Machine with Microsoft Entra ID login enabled

1. Browse to the Azure portal at `https://portal.azure.com`.

**Lab tip** - if prompted to save your credentials, choose Never.  And cancel the tour, unless this is your first time in the Azure Portal.

1. Select **+ Create a resource**.

1. Type **Windows 11** in Search the Marketplace search bar, then **Enter**.

1. Find the **Microsoft Windows 11** box, then select the **Create v** and choose **Windows 11 Enterprise, version 25H2** from the menu that opens.

1. Create the VM using the following values on the **Basics** tab:

  | Field | Value to use |
  | :-- | :-- |
  | Subscription | Accept the default |
  | Resource Group | Select or create a new resource group for this lab |
  | Virtual machine name | **vmEntraLogin** |
  | Region | *default* |
  | Availability options | **No infrastructure redundancy required** |
  | Security Type | **Standard** |
  | Size | **Standard D2s_v7 - 2 vcpus, 8 GiB memory** |
  | | **Lab tip** - if the exact specified size is not available, try a similar size in the same series.|
  | Admin Username | **vmEntraAdmin** |
  | Admin Password | Use the password provided by the lab environment if it meets the Azure requirement of 12-123 characters. Otherwise, create a secure password of at least 12 characters that you can remember. |
  | Licensing | Confirm you have a license |

1. You will not need to change anything on the **Disks** or **Networking** tabs, but you can review the values.

1. On the **Management** tab, under **Microsoft Entra ID** section, select the **Login with Microsoft Entra ID** checkbox.

      >**Note:** You will notice that the **System assigned managed identity** under the Identity section is automatically checked and turned grey. This action should happen automatically once you enable Login with Microsoft Entra ID.

1. Go through the rest of the experience of creating a virtual machine. 

1. Select **Review + create** then select **Create**.

1. Wait for the deployment to reach **Succeeded**, then open **vmEntraLogin**.

1. Under **Settings**, select **Identity** and verify that **System assigned** status is **On**.

1. Under **Settings**, select **Extensions + applications** and verify that **AADLoginForWindows** has provisioning state **Succeeded** before continuing.

#### Task 2 - Microsoft Entra ID login for existing Azure Virtual Machines

> **Important:** The account performing this task must be able to create Azure role assignments at the VM scope or an ancestor scope. Use an account with **Role Based Access Control Administrator**, **User Access Administrator**, or **Owner**. **Contributor** alone cannot create the required assignment. If **Add role assignment** is disabled, contact the environment administrator rather than continuing to the sign-in test.

1. In the Azure portal, go to **Virtual Machines**.

1. Select the newly created Virtual Machine from Task 1.

1. Select **Access control (IAM)**.

1. Select **+ Add**, then **Add role assignment** to open the Add role assignment page.

1. Assign the following settings:
  - **Job function roles**
  - **Role**: Virtual Machine Administrator Login
  - **Members**: Choose User, group, or service principal.  Then use **+ Select members** to add **User2** as a specific user for the VM.

1. Select **Review + assign** to complete the process.

1. Verify that **User2** appears under **Role assignments** with the **Virtual Machine Administrator Login** role at the VM scope. Allow up to 10 minutes for the assignment to propagate before testing a new RDP session.

#### Task 3 - Update the Virtual Machine to allow the Microsoft Entra ID login

1. On the virtual machine page, select **Connect** from the top menu, and then select **Connect**.

1. On the **Connect** page, under **Native RDP**, select **Download RDP file**.

1. In the browser prompt, select **Keep**, and then open the downloaded RDP file.

1. On the **Remote Desktop Connection** security warning dialog box, select **Connect**.

1. Choose to log in as Alternate User.

1. Use the Admin (vmEntraAdmin) username and Password you created when setting up the virtual machine.
   - If prompted, say yes to allow access to the virtual machine or RDP session.

1. Wait for the virtual machine to open and all the software to load.

1. Select the **Start button** in the virtual machine.

1. Type **Control Panel** and launch the control panel app.

1. Select **System and Security** from the list of settings.

1. From the **System** setting, select the **Allow remote access** option.

1. At the bottom of the dialog box that opens you will see a **Remote Desktop** section.

1. **Uncheck** the box labeled **Allow connections only from computers running Remote Desktop with Network Level Authentication**.

1. Select **Apply** and then **OK**.

1. **Exit** the virtual machine RDP session.

#### Task 4 - Modify your RDP file to support the Microsoft Entra ID login

1. Open the **Downloads** folder in file manager.

1. **Make a copy** of the RDP file and add **-EntraID** to the end of the filename.

1. Edit the new version of the RDP file you just copied using **Notepad**. Add the these two lines of text to the bottom of the file:
     ```
        enablecredsspsupport:i:0
        authentication level:i:2
     ```
 
 1. **Save** the RDP file.  You should now have two versions of the file:
      - <<virtual machine name>>.RDP
      - <<virtual machine name>>-EntraID.RDP

#### Task 5 - Connect to the Windows virtual machine using Microsoft Entra ID login

1. Open the **<<virtual machine name>>-EntraID.RDP**

1. Select **Connect** when the dialog opens.

1. Instead of getting prompted on what User Account to log in with, you should get a message prompting on whether you want to connect to the remote computer.

1. Select **Yes** from the bottom of the screen.

1. The Remote Desktop session should open and show the Windows 11 login screen. **Other User** with an OK button should be displayed.

1. Select **OK**.

1. In the login dialog enter the following information:
   - Username = `AzureAD\User2@<your domain name>`
   - Password = Enter the password provided for User2

    >**Note:** User2 is the user we granted access to log in as administrator during Task 2.

1. Windows should confirm the login and open to the normal Desktop.

#### Task 6 -- Optional testing to explore the Microsoft Entra ID login

1. Check to see that User2 was the only user added to the Administrators group.

1. Use the secondary mouse click on the START button, then select **Computer Management** in the popup menu.

1. Open **Local Users and Groups** then navigate to **Groups, Administrators**.

1. You should see **Azure\User2....** in the list.

1. Check to see if other Microsoft Entra ID members can log in.

1. Exit out of the remote desktop session.

1. Launch the **<<server name>>-EntraID.RDP** file again.

1. Try to log in as other Microsoft Entra ID members.

1. You should notice that each of these users are denied access.

### Optional Exercise 2 - Login to Linux Virtual Machines in Azure with Microsoft Entra ID

#### Task 1 - Create a Linux VM with system assigned managed identity

1. Browse to the **Microsoft Azure** portal at `https://portal.azure.com`.

1. Select **+ Create a resource**.

1. Search for **Ubuntu**.

1. Select on **Create** under **Ubuntu Server 22.04 LTS**. You may use other Linux servers for this test lab.

1. On the **Management** tab, check the box to enable **Login with Microsoft Entra ID**.

1. Ensure **System assigned managed identity** is checked.

1. Go through the rest of the experience of creating a virtual machine. During this preview, you’ll have to create an administrator account with username and password or SSH public key.

#### Task 2 - Microsoft Entra ID login for existing Azure Virtual Machines

1. In the **Microsoft Azure** portal, go to **Virtual Machines**.

1. Select **Access control (IAM)**.

1. Select Add > Add role assignment to open the Add role assignment page.

1. Assign the following role. 
    - **Role**: Virtual Machine Administrator Login or Virtual Machine User Login
    - **Assign access to**: User, group, service principal, or managed identity

##### Challenge lab portion

Please try to complete the rest of this lab on your own. It is very similar to the Windows version. If you are looking for detailed steps, see [Assign Azure roles using the Azure portal](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal) in the Learn Docs. [Sign in to a Linux virtual machine in Azure by using Microsoft Entra ID and OpenSSH](https://learn.microsoft.com/en-us/entra/identity/devices/howto-vm-sign-in-azure-ad-linux)

### Exercise summary

In this exercise, you signed in to an Azure VM using a Microsoft Entra ID account and reviewed the Linux equivalent. This exercise showed how Microsoft Entra authentication works for Azure compute resources without local accounts.
