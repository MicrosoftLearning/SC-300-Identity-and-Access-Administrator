---
lab:
    title: '24 - Add app roles to your app and receive them in the token'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 24: Add app roles to your app and receive them in the token

## Lab scenario

Role-based access control (RBAC) is a popular mechanism to enforce authorization in applications. When using RBAC, an administrator grants permissions to roles, and not to individual users or groups. The administrator can then assign roles to different users and groups to control who has access to what content and functionality. You plan to implement RBAC roles and need to verify you understand how to perform the procedure.

#### Estimated time: 10 minutes

### Exercise 1 - Adding roles to your apps

#### Task 1 - Declare app roles using the App roles UI

   **IMPORTANT** - The app roles portal UI feature is in public preview. This preview is provided without a service-level agreement and isn't recommended for production workloads. Certain features might be unsupported or have constrained capabilities.

To create an app role by using the Azure portal's user interface:

1. Sign in to [https://portal.azure.com](https://portal.azure.com) using a Global Administrator account.

2. Open the portal menu and then select **Azure Active Directory**.

3. On the **Azure Active Directory** blade, under **Manage,** select **App registrations**.

4. Select the **Demo App** app registration item created previously.

5. Select **App roles**, and then select **+ Create app role**.

    ![Screen image displaying app roles with create app role highlighted](./media/lp3-mod3-app-roles-create-app-role.png)

6. In the **Create app role** pane, in the **Display name** box, enter **Survey Writer**.

7. Under **Allow member types**, select **User/Groups**.

8. In the **Value** box, enter **Survey.Create**.

9. In the **Description** box, enter **Writers can create surveys**.

10. Notice that the description is a mandatory field.

11. Verify the **Do you want to enable this app role** is selected and then select **Apply.**

#### Task 2 - Assign users and groups to roles

Once you've added app roles in your application, you can assign users and groups to the roles. Assign users and groups to roles through the portal's UI or programmatically using [https://docs.microsoft.com/graph/api/user-post-approleassignments](https://docs.microsoft.com/graph/api/user-post-approleassignments). When the users assigned to the various app roles sign in to the application, their tokens will have their assigned roles in the roles claim.

To assign users and groups to roles by using the Azure portal:

1. Sign in to [https://portal.azure.com](https://portal.azure.com).

2. In Azure Active Directory, in the navigation menu on the left, select **Enterprise applications.**

3. In the **All applications** list, select **Demo app**.

4. This app was created in an earlier exercise.

5. Under **Manage**, select **Users and groups.**

6. On the menu, select **+ Add user/group.**

7. On the **Add Assignment** blade, select **None Selected** under Users and groups.

8. A list of users and security groups is displayed. You can search for **Grady** and add Grady Archie.

9. After you have selected users and groups, select **Select**.

10. In the **Select a role** assignment, ensure that **Survey Writer** is selected.

    **Note** - you only have Survey Writer so this option will appear grayed out.

11. Select **Assign** to finish the assignment of users and groups to the app.

12. Confirm that the users and groups you added appear in the **Users and groups** list.
