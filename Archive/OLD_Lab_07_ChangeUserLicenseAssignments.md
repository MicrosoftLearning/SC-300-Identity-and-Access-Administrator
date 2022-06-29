---
lab:
    title: '07 - Change user account license assignments'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 07: Change user account license assignments

## Lab scenario

Some user accounts in your organization will not be provided all available products in their assigned license or will need updates or additions to their license assignment. You need to ensure you are able to update a user account's license assignment in Azure AD.

#### Estimated time: 5 minutes

### Exercise 1 - Add a Windows 10 license to a user account

#### Task 1 - Find your unlicensed user in Azure Active Directory

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Mange**, select **Users**.

3. In the Users blade, enter **Raul** into the search box.

4. Select on **Raul Razo**
5. Review Raul's profile and ensure he has a Usage Location set.

    **Warning** - To assign a license to a user, the user must assigned a usage location.

6. Select the **Licenses** menu item in the left-hand menu.
7. Ensure that Raul has "No license assignments found."

#### Task 2 - Update user license assignments

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Manage**, select **Users**

3. In the Users blade, select **Raul Razo**.

4. In the left navigation, select **Licenses**.

5. Select the **+ Assignments** button. 

6. On the Update license assignments blade, select the check box for a **Windows 10/11 Enterprise E3** license.

    ![Screen image displaying the Update license assignments page and license options highlighted](./media/lp1-mod2-assign-user-license-options.png)

7. When complete, select **Save**.
8. At the top of the screen Select `Home > Contoso Marketing > User >` **Raul Razo**
9. Notice that the license has been assigned.
