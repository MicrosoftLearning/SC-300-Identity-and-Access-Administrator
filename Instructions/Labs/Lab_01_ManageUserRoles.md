---
lab:
    title: '01 - Manage User Roles'
    learning path: '01'
    module: 'Module 01 - Implement an Identity Management Solution'
---

# Lab 01: Manage user roles

## Lab scenario

Your company recently hired a new employee who will perform duties as an application administrator. You must create a new user and assign the appropriate role.

#### Estimated time: 30 minutes

### Exercise 1 - Create a new user and test their application admin rights

#### Task 1 - Add a new user

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator

2. Search for and then select **Azure Active Directory**.

3. In the left navigation menu, under **Manage**, select **Users > + New User**.
# RobertS --> Probably need to swap the > for a ", then select" for screen read purposes.

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
# RobertS --> Task 1, Step 6 and Task 2, Step 3 – Do we want to use those passwords?  With the hacks that have occurred in the past, I think we were going with “Enter a secure password that you will remember.”  I know you copied this directly out of the existing labs, and that the lab will be hosted in an unknown Tenant.  So this is an ask for your opinion, not an ask to change at this point.

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
7. Click on **+ New application**. Notice that **+ Create your own application** is unavailable.
# RobertS --> I think you need to close the New Application page to get back to the Enterprise Apps menu, before the next step.

9. Try clicking on some of the other settings like **Application Proxy**, **User settings**, and others to see the **Chris Green** does not have rights.
10. Click on **ChrisG** name in the upper-right corner and sign out.


### Exercise 2 - Assign the application admin role and create an app

#### Task 1 - Assign a role to a user

Using Azure Active Directory (Azure AD), you can designate limited administrators to manage identity tasks in less-privileged roles. Administrators can be assigned for such purposes as adding or changing users, assigning administrative roles, resetting user passwords, managing user licenses, and managing domain names.

1. If you are not already logged in as a Global Administrator role, open the Azure Portal and log in.
2. Navigae to Azure Active Directory blade.
# RobertS --> We are trying to limit the use of blade.  I generally use page or app.

4. Click on **Users** under the Manage section of the menu.
5. Click on **Chris Green** account.
6. Choose **Assigned roles** from the Manage menu.
7. Click **+ Add assignments** and mark the `Application administrator` role.
8. Click **Add**
# RobertS --> This one is a PROBLEM-CHILD.  If you have added your Azure AD Premium 2, then you get the PIM (Privileged Identity Manager UI).  So your steps and UI are wrong for this one.  You get a Next button and have to pick if Eligible / Permanent.  I don't have a good fix, as it is unpredictable on Skillable lab platform when you will get standard user role assignment versus PIM.  Unless you know a way in the UI to force it not to use PIM.

    ![Assigned roles page - showing the selected role](./media/directory-role-select-role.png)

8. Click the **Refesh** button.

   **Note - The newly assigned Application administrator role appears on the user’s Assigned roles page.**

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

   **Note - This role now has the ability to add applications to the tenant.  We will experiment more with this feature in later labs.**

7. Sign out of the Chris Green instance of the Azure Portal and close the browser.

### Exercise 3 - Remove a role assignment

#### Task 1 - Remove the application administrator from Chris Green

This task will use an alternative method to remove the assigned role; it will use the **Roles and administrators** option in Azure AD.

1. If you are not already logged in as your Global Admin, launch the Azure Portal and log in now.
2. In the search box type **Azure Active Directory** and launch Azure AD.
3. In **Azure Active Directory**, select **Roles and administrators**, and then select the **Application administrator** role from the list.
# RobertS --> Same challenge as above, I get the PIM interface, instead of the normal UI.

   **Note - You could select multiple roles at this point to perform some bulk activities.**

4. On the **Application administrator | Assignments** page you should see Chris Green's name listed.
5. Put a check in the box next to Chris Green.
6. Click **X Remove assignments** from the options at the top of the dialog.
7. Answer **Yes** when the confirmation box opens.
8. Close Azure Active Directory.

### Exercise 4 - Bulk import of users

#### Task 1 - Bulk operations for creating users with a .csv file

1. In the Azure AD menu, select **Users** under **Manage**.

1. On the **Users | All users** tile, select the **Bulk operations** drop-down arrow and then **Bulk create**.

1. Selecting **Bulk create** will open a new tile. This tile provides a **Download** link to a template file that you will edit to populate with your user information and upload to add the bulk creation of users.

1. Select **Download** to download the .csv file.

1. The .csv template provides you with the fields included with the user profile. This includes the required username, display name, and initial password. You can also complete optional fields, such as Department and Usage location, at this time. The following screenshot is an example of how you can complete the .csvfile: 

    ![Bulk import using csv file entry](./media/bulkimportexample.png)

1. Once populated, save the changes and upload it to add the users.

1. You will be notified that the file uploaded successfully.  Choose Submit to add the users. 

After the users have been created, you will be prompted that the creation has succeeded.  Close the Bulk create users tile and the new users will be populated in the list of **Users | All users**. 

#### Task 2 - Bulk addition of users using PowerShell

1. Open PowerShell as an administrator.  This can be done by searching for PowerShell in Windows and choosing Run as administrator.
# RobertS --> In the Skillable platform I get Windows PowerShell, Windows PowerShell ISE, and PowerShell 7 to launch.  I am pretty sure you want Windows PowerShell, but think we should be specific.

1. You will need to add the Azure AD PowerShell module, if you have not used it before.  Run the command: Install-Module AzureAD.  When prompted, select “Y” to continue.

    ```
    Install-Module Azure AD
    ```
# RobertS --> I think you wanted AzureAD without a " " like the line below.

1. Confirm that the module installed correctly by running the command:  

    ```
    Get-Module AzureAD 
    ```

1. Next, you will need to login to Azure by running:  

    ```
    Connect-AzureAD 
    ``` 

1. The Microsoft login window will appear for you to login to Azure AD.  

1. To verify that you are connected and to see existing users, run:  

    ``` 
    Get-AzureADUser 
    ```
    
1. To assign a common temporary password to all new users, run the following command and replace the TempPW with the password that you would like to provide to your users.  

    ``` 
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    ```

    ```
    $PasswordProfile.Password = "TempPW" 
    ```

1. You are ready to create a new users.  The following command will be populated with the user information and run.  If you have more than one user to add, you can use a notepad txt file to add the user information and copy/paste into PowerShell. 

    ```
    New-AzureADUser -DisplayName "New User" -PasswordProfile $PasswordProfile -UserPrincipalName "NewUser@contoso.com" -AccountEnabled $true -MailNickName "Newuser"
    ```
# RobertS --> @contoso.com is not a valid domain name; you have to use the Skillable provided tenant name.  Also, the password does not meet complexity standards so the command fails that way also; I updated to "Pass@word1" and it worked.

## Experiment with managing users

You can add and remove users with the Azure AD blade.  However, users can be created and roles can be assigned using the scripting.  Experiment with giving the Chris Green user account a different role using script. 
 

### Exercise 5 - Remove a user from Azure Active Directory

#### Task 1 - Remove a User

It may happen that an account is deleted and then needs to be recovered. You need to verify you can recover an account that has been deleted recently.

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Manage**, select **Users**.

3. In the **Users** list, select the check box for a user that will be deleted. For example, select **Chris Green**.

    **Tip** - Selecting users from the list allows you to manage multiple users at the same time. If you select the user, to open that user’s blade, you will only be managing that individual user.

    ![Screen image displaying the All users users list with one user check box selected and another check box highlighted indicating the ability to select multiple users from the list.](./media/lp1-mod2-remove-user.png)

4. With the user account selected, on the menu, select **Delete user**.
# RobertS --> The UI only has Delete (not Delete user) now.

5. Review the dialog box and then select **OK**.
# RobertS --> And the confirmation is Yes / No.

#### Task 2 - Restore a deleted user

1. In the Users blade, in the left navigation, select **Deleted users**.

2. Review the list of deleted users and select the user you just deleted.
# RobertS --> Do we want to just say "Chris Green" since that is the user we just asked them to delete?

    **Important** - By default, deleted user accounts are permanently removed from Azure Active Directory automatically after 30 days.

3. On the menu, select **Restore user**.

4. Review the dialog box and then select **OK**.

5. In the left navigation, select **All users**.

6. Verify the user has been restored.


### Exercise 6 - Add a Windows 10 license to a user account

#### Task 1 - Find your unlicensed user in Azure Active Directory

Some user accounts in your organization will not be provided all available products in their assigned license or will need updates or additions to their license assignment. You need to ensure you are able to update a user account's license assignment in Azure AD.

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Mange**, select **Users**.

3. In the Users blade, enter **Raul** into the search box.

4. Click on **Raul Razo**
5. Review Raul's profile and ensure he has a Usage Location set.

    **Warning** - To assign a license to a user, the user must assigned a usage location.

6. Click the **Licenses** menu item in the left-hand menu.
7. Ensure that Raul has "No license assignments found."

#### Task 2 - Update user license assignments
# RobertS --> Not sure this would be split into two tasks.  In the original version (group licensing lab, 3 I think) it had you check the No Licenses, then log on as the user and try to launch office to watch it fail.  Then add the license in a task.  Then try again to launch office to show it works.  I have gotten through enough labs yet to see.  But if that is not the plan; then you can probably just have 1 task here.

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Manage**, select **Users**

3. In the Users blade, select **Raul Razo**.

4. In the left navigation, select **Licenses**.

5. Select the **+ Assignments** button. 

6. On the Update license assignments blade, select the check box for a **Windows 10/11 Enterprise E3** license.

    ![Screen image displaying the Update license assignments page and license options highlighted](./media/lp1-mod2-assign-user-license-options.png)

7. When complete, select **Save**.
8. At the top of the screen click `Home > Contoso Marketing > User >` **Raul Razo**
# RobertS --> Note that we at this point the Domain / Tenant name is just Contoso, not Contoso Marketing in the Skillable platform.

10. Notice that the license has been assigned.
