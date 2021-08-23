---
lab:
    title: '08 - Configure external collaboration settings'
    learning path: '01'
    module: 'Module 03 - Implement and manage external identities'
---

# Lab 08: Configure external collaboration settings

## Lab scenario

You must enable external collaboration settings for your organization for approved guests access.

#### Estimated timing: 5 minutes

## Exercise 1 - Allowing guest users to be invited into your organization

### Task 1 - Configure external collaboration settings

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a tenant administrator.
2. Select **Azure Active Directory**.
3. Select **External Identities > External collaboration settings**.
4. Click the **Email one-time passcode** notification link you see near the top of the screen.

    **Note** - A one-time passcode is a very secure way to invite a user to join your organization.

5. Click on `Home > Contoso Marketing >` ** External Identities to return to the previous screen.
6. 


4. Under **Guest user access**, review access levels that are available and then select **Guest user access is restricted to properties and memberships of their own directory objects (most restrictive)**.

    **NOTE**

    - Guest users have the same access as members (most inclusive): This option gives guests the same access to Azure AD resources and directory data as member users.
    - Guest users have limited access to properties and memberships of directory objects: (Default) This setting blocks guests from certain directory tasks, like enumerating users, groups, or other directory resources. Guests can see membership of all non-hidden groups.
    - Guest user access is restricted to properties and memberships of their own directory objects (most restrictive): With this setting, guests can access only their own profiles. Guests are not allowed to see other users' profiles, groups, or group memberships.

    ![Screen image displaying guest user access restriction options](./media/lp1-mod3-guest-user-access-restrictions.png)

5. Under **Guest invite settings**,  select **Member users and users assigned to specific admin roles can invite guest users including guests with member permissions**!

    **NOTE**
    
    - Admins and users in the guest inviter role can invite: To allow admins and users in the "Guest Inviter" role to invite guests, set this policy to Yes.
    - Members can invite: To allow non-admin members of your directory to invite guests, set this policy to Yes.
    - Guests can invite: To allow guests to invite other guests, set this policy to Yes.
    - Enable guest self-service sign up via user flows: Enables or disables self-service sign up for guests via user flows associated with applications in your directory. When disabled, guests are required to be invited to your directory.
    - If Members can invite is set to No and Admins and users in the guest inviter role can invite is set to Yes, users in the Guest Inviter role will still be able to invite guests.

    ![Screen image displaying guest invite settings with Guests can invite set to No and highlighted](./media/lp1-mod3-guest-user-invite-settings.png)

6. Under **Collaboration restrictions**, review the available options and accept the default settings.

    **IMPORTANT**
    
    - You can create either an allow list or a deny list. You can't set up both types of lists. By default, whatever domains are not in the allow list are on the deny list, and vice versa.
    - You can create only one policy per organization. You can update the policy to include more domains, or you can delete the policy to create a new one.
    - The number of domains you can add to an allow list or deny list is limited only by the size of the policy. The maximum size of the entire policy is 25 KB (25,000 characters), which includes the allow list or deny list and any other parameters configured for other features.
    - This list works independently from OneDrive for Business and SharePoint Online allow/block lists. If you want to restrict individual file sharing in SharePoint Online, you need to set up an allow or deny list for OneDrive for Business and SharePoint Online.
    - The list does not apply to external users who have already redeemed the invitation. The list will be enforced after the list is set up. If a user invitation is in a pending state, and you set a policy that blocks their domain, the user's attempt to redeem the invitation will fail.

7. When finished, save your changes.
