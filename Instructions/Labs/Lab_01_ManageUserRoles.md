---
lab:
    title: '01 - Manage User Roles'
    learning path: '01'
    module: 'Module 01 - Implement an Identity Management Solution'
---

# Lab 01: Manage user roles

## Lab scenario

Your company recently hired a new employee who will perform duties as an application administrator. You must create a new user and assign the appropriate role.

#### Estimated time: 10 minutes

### Exercise 1 - Create a new user and test their application admin rights

#### Task 1 - Add a new user

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator

2. Search for and then select **Azure Active Directory**.

3. In the left navigation menu, under **Manage**, select **Users > + New User**.

4. Ensure that Create User is selected.  Create a user using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | User name| ChrisG|
    | Name| Chris Green|
    | First name| Chris|
    | Last name| Green|

5. Mark the **Let me create the password**

6. Use password = **Pass@word1**

     *You will have to change the password upon first login to this account*

7. Select **Create**. The user is now created and registered to your organization.

#### Task 2 - Login and try to create an app

1. Launch a new InPrivate browser window.
2. Open the Azure Portal [https://portal.azure.com](https://portal.azure.com) as Chris Green.

    | **Setting**| **Value**|
    | :--- | :--- |
    | User name| ChrisG@`your domain name.com`|
    | Password| Pass@word1|

3. Update your password.

    | **Setting**| **Value**|
    | :--- | :--- |
    | Current Password| Pass@word1|
    | New Password| Pa$$w.rd1234|
    | Confirm Password| Pa$$w.rd1234|

4. If you see a **Welcome to Microsoft Azure** tour dialog, click the **Maybe Later** button.

5. Search on and select **Enterprise applications** in the search dialog at the top of the screen.
6. Click on **+ New application**. Notice that **+ Create your own application** is unavailable.
7. Try clicking on some of the other settings like **Application Proxy**, **User settings**, and others to see the **Chris Green** does not have rights.
8. Click on **ChrisG** name in the upper-right corner and sign out.

### Exercise 2 - Assign the application admin role and create an app

#### Task 1 - Assign a role to a user

Using Azure Active Directory (Azure AD), you can designate limited administrators to manage identity tasks in less-privileged roles. Administrators can be assigned for such purposes as adding or changing users, assigning administrative roles, resetting user passwords, managing user licenses, and managing domain names.

1. If you are not already logged in as a Global Administrator role, open the Azure Portal and log in.
2. Navigae to Azure Active Directory blade.
3. Click on **Users** under the Manage section of the menu.
4. Click on **Chris Green** account.
5. Choose **Assigned roles** from the Manage menu.
6. Click **+ Add assignments** and mark the `Application administrator` role.
7. Click **Add**

    ![Assigned roles page - showing the selected role](./media/directory-role-select-role.png)

8. Click the **Refesh** button.

     ##### The newly assigned Application administrator role appears on the user’s **Assigned roles** page.

#### Task 2 - Check application permissions

1. Launch a new InPrivate browser window.
2. Open the Azure Portal [https://portal.azure.com](https://portal.azure.com) as Chris Green.

    | **Setting**| **Value**|
    | :--- | :--- |
    | User name| ChrisG@`your domain name.com`|
    | Password| Pa$$w.rd1234|

3. If you see a **Welcome to Microsoft Azure** tour dialog, click the **Maybe Later** button.
4. Search on and select **Enterprise applications** in the search dialog at the top of the screen.
5. Notice that **+ New Application** is available now.
6. Click **+ New Application**

     ##### This role now has the ability to add applications to the tenant.  We will experiment more with this feature in later labs.

7. Sign out of the Chris Green instance of the Azure Portal and close the browser.

### Exercise 3 - Remove a role assignment

#### Task 1 - Remove the application administrator from Chris Green

This task will use an alternative method to remove the assigned role; it will use the **Roles and administrators** option in Azure AD.

1. If you are not already logged in as your Global Admin, launch the Azure Portal and log in now.
2. In the search box type **Azure Active Directory** and launch Azure AD.
3. In **Azure Active Directory**, select **Roles and administrators**, and then select the **Application administrator** role from the list.

     ##### Note that you could select multiple roles at this point to perform some bulk activities.

4. On the **Application administrator | Assignments** page you should see Chris Green's name listed.
5. Put a check in the box next to Chris Green.
6. Click **X Remove assignments** from the options at the top of the dialog.
7. Answer **Yes** when the confirmation box opens.
8. Close Azure Active Directory.

## Experiment with managing users

You can add and remove users with the Azure AD blade.  However, users can be created and roles can be assigned using the scripting.  Experiment with giving the Chris Green user account a different role using script.
