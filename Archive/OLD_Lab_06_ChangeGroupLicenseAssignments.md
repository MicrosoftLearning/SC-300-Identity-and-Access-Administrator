---
lab:
    title: '06 - Change group license assignments'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Change group license assignments

## Lab scenario

Occasionally, you may need to change the license assignment that are used by an Azure AD security group. You must ensure you are familiar with the procedure for changing a group's license assignment.

#### Estimated time: 5 minutes

### Exercise 1 - Change group license assignments

#### Task - Use Azure AD portal to make changes

1. Browse to [https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview]( https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Overview).

2. In the left navigation, under **Manage**, select **Groups**.

3. Select the **sg-Finance** group.

4. In the left navigation, under **Manage**, select **Licenses**.

5. Review the current assignments and then, on the menu, select **+ Assignments**.

    ![Screen image displaying group license option selected with the current licenses and Assignments menu option highlighted](./media/lp1-mod2-change-group-license.png)

6. On the Update license assignments blade, select **Windows 10/11 Enterprise E3** license, clear the selection of an existing license, add or remove license options, or any combination.

7. When complete, select **Save**.

8. On the group’s Licenses page, review the change.
