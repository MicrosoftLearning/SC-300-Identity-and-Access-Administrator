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

1. Select **Windows Server** and choose **Windows Server 2019 Datacenter** from Select a software plan dropdown.

1. You will have to create an administrator username and password for the VM on the basics tab.

1. On the **Management** tab, check the box to Login with Azure AD under the Azure AD section.

1. Make sure **System assigned managed identity** under the Identity section is checked. This action should happen automatically once you enable Login with Azure AD.

1. Go through the rest of the experience of creating a virtual machine. 

1. Select Create.

#### Task 2 - Azure AD login for existing Azure Virtual Machines

1. Browse to **Virtual Machines** in the [https://portal.azure.com](https://portal.azure.com).

1. Select **Access control (IAM)**.

1. Select **Add**, then **Add role assignment** to open the Add role assignment page.

1. Assign the following role. 
    - **Role**: Virtual Machine Administrator Login or Virtual Machine User Login
    - **Assign access to**: User, group, service principal, or managed identity

1. For detailed steps, see Assign Azure roles using the Azure portal.

### Exercise 2 - Login to Linux Virtual Machines in Azure with Azure AD

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
