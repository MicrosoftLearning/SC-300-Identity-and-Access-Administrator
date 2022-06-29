---
lab:
    title: '11 - Working  with dynamic groups'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 11: Working  with dynamic groups

## Lab scenario

As your company grows, manually group management is too time consuming. Since standardizing the directory, you can now take advantage of dynamic groups. You must create a new dynamic group to ensure you're ready for dynamic group creation in production.

#### Estimated time: 10 minutes

### Exercise 1 - Creating a dynamic group with all users as members

#### Task 1 - Create the dynamic group

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) with an account that is assigned the Global administrator or User administrator role in the tenant.

2. Select **Azure Active Directory**.

3. Under **Manage**, select **Groups**, and then select **New group**.

4. On the New Group page, under **Group type**, select **Security**.

5. In the **Group name** box, enter **SC300-myDynamicGroup**.

6. Select the **Membership type** menu and then select **Dynamic User**.

7. Under **Dynamic user members**, select **Add dynamic query**.

8. On the right above the **Rule syntax** box, select **Edit**.

9. In the Edit rule syntax pane, enter the following expression in the **Rule syntax** box:

    ```powershell
    user.objectid -ne null
    ```

    **Warning** - the `user.objectid` is case sensitive.

10. Select **OK**. The rule appears in the Rule syntax box.

    ![Screen image displaying the dynamic group membership rules blade with rule syntax highlighted](./media/lp1-mod3-dynamic-group-membership-rule.png)

11. Select **Save**. The new dynamic group will now include B2B guest users as well as member users.

12. On the New group page, select **Create** to create the group.

#### Task 2 - Verify the members have been added

1. Select on the **Home** `Azure Active Directory`.
2. Launch **Azure Active Directory**.
3. In the **Manage** menu Select on **Groups**.
4. In the filter box type **SC300** and your newly created group will be listed.
5. Select on **SC300-myDynamicGroup** to open the group.
6. Notice that it shows that it contains 30+ **Direct members*.
7. Select on **Members** in the **Manage** menu.
8. Review the members.

#### Task 3 - Experiment with alternate rules

1. Try making a group with only **Guest** users:
   - (user.objectid -ne null) and (user.userType -eq "Guest")

2. Try make a group with only **Members** of the Azure AD users.
   - (user.objectid -ne null) and (user.userType -eq "Member")
