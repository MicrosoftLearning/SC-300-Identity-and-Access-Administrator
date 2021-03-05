---
lab:
    title: '06 - Working  with dynamic groups'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Working  with dynamic groups

# Student lab manual

## Lab scenario

As your company grows, manually group management is too time consuming. Since standardizing the directory, you can now take advantage of dynamic groups. You must create a new dynamic group to ensure you're ready for dynamic group creation in production.

#### Estimated time: 10 minutes

## Creating a dynamic group with all users as members

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) with an account that is assigned the Global administrator or User administrator role in the tenant.

1. Select **Azure Active Directory**.

1. Under **Manage**, select **Groups**, and then select **New group**.

1. On the New Group page, under **Group type**, select **Security**.

1. In the **Group name** box, enter **All company users dynamic group**.

1. Select the **Membership type** menu and then select **Dynamic User**.

1. Under **Dynamic user members**, select **Add dynamic query**.

1. On the right above the **Rule syntax** box, select **Edit**.

1. In the Edit rule syntax pane, enter the following expression in the **Rule syntax** box:

    ```powershell
    user.objectId -ne null
    ```

1. Select **OK**. The rule appears in the Rule syntax box.

    ![Screen image displaying the dynamic group membership rules blade with rule syntax highlighted](./media/lp1-mod3-dynamic-group-membership-rule.png)

1. Select **Save**. The new dynamic group will now include B2B guest users as well as member users.

1. On the New group page, select **Create** to create the group.
