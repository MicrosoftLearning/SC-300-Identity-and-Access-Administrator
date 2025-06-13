---
lab:
    title: '06 - Add a federated identity provider'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Add a federated identity provider

### Login type = Microsoft 365 admin

## Lab scenario

Your company works with many vendors and, on occasion, you need to add some vendor accounts to your directory as a guest and allow them to use their Google account to sign-in.

#### Estimated time: 25 minutes

### Exercise 1 - Configure identity providers

#### Task 1 - Configure Google to be used as an identity provider

**Important Note** - For this exercise, you will need a Gmail account on Google. Create a **new Google account** and then follow the steps for the exercise.  Be sure to note the email address and password, they are necessary to complete the lab.

1. Go to the Google APIs at https://console.developers.google.com, and sign in with your Google account. We recommend that you use a shared team Google account.

2. Accept the terms of service if you're prompted to do so.

**Create a new project:**
3. At the top of the page, select the project menu to open the Select a project page. Choose **New Project**.  Leave the remaining fields with the default settings.

4. On the New Project page, give the project a name: +++MyB2BApp+++, and then select **Create**.

5. Open the new project by selecting the link in the Notifications message box or by using the project menu at the top of the page.

6. In the left menu, select **APIs & Services**, and then select **OAuth consent screen**.

7. Select the **Get Started** button.

8. On the Application information screen enter the following information:

| Section | Field Name | Value |
| :---    | :---    | :---  |
| 1 App Information | | |
|            | App name | +++Microsoft Entra ID+++ |
|            | User support email | Select the email name from the drop down |
| 2 Audience | | |
|            | Internal / External | **External** |
| 3 Contact Information | | |
|            | Email addresses | Use the same email address as above |
| 4 Finish | | |
|            | Agreement | Mark the checkbox |

9. Select the **Create** button to continue.

10. Select the **Create OAuth client** button.

11. Choose **Application type = Web Application**.

12. Accept the default name for the application.

13. Within the **Authorized JavaScript origins**, select the **+ Add URI** button.

14. Enter the URI +++https://microsoftonline.com+++ for the value.

15. Within the **Authorized redirect URIs**, select **+ Add URI** button.  You will need to add three different URI's in this section:

 - **First URI** = +++https://login.microsoftonline.com+++
 - **Second URI** = +++https://login.microsoftonline.com/te/**tenant ID**/oauth2/authresp+++ (where <tenant ID> is your tenant ID)
 - **Third URI** = +++https://login.microsoftonline.com/te/**tenant name**.onmicrosoft.com/oauth2/authresp+++ (where <tenant name> is your tenant name)

**Lab Tip** - you may find this step easier if you use Notepad in the lab VM to create these URI, and then copy and paste from there.

**Lab Tip 2** - Results should look similar to this, with your Tenant ID and Tenant Name.

| URI # | Link |
| :--- | :--- |
| URIs 1 | https://login.microsoftonline.com |
| URIs 2 | https://login.microsoftonline.com/te/aaaa1111bbbb2222cccc |
| URIs 3 | https://login.microsoftonline.com/te/MyTenantName.onmicrosoft.com/oauth |

16. Select the **Create** button.

17. When the item is created, copy the **Client ID** and the **Client Secret** into Notepad for user later.

18. You can lease your project in this state, we don't need to publish.

#### Task 2 - Add a test user

1. From the menu on the left, select the **Audience** item.

2. In the **Test Users** section of the page, choose **+ Add Users**.

3. Enter the gmail account you are using for this lab.

4. Select **Save**

#### Task 3 - Add authorized domain to Branding

1. From the menu on the left, select the **Branding** item.

2. Scroll to the very bottom of the page.

3. In the **Authorized domains** section, add the domain **microsoftonline.com**.

4. In the **Developer contact information** add they email address you are using for this lab.

5. Select **Save**.


### Exercise 2 - Configure Azure to work with an External identity provider

#### Task 1 - Configure Microsoft Entra ID for Google federation
1. Sign in to the [https://entra.microsoft.com](https://entra.microsoft.com) as an admin.

2. Select **Microsoft Entra ID**.

3. Under **Identity**, select **External Identities**.

4. Choose **All identity providers** from the menu on the left.

5. Microsoft provides a direct federation for **Google** as an identity provider.  This can be initiated by selecting **+ Google** from the **External Identities | All identity providers** page
 
6. After selecting + Google, another page will open with additional information that is required to configure Google as an identity provider.  

7. Enter the **Client ID** and **Client secret** you obtained earlier.

8. Select **Save**.

This completes the configuration of Google as an identity provider.

#### Task 2 - Invite you Test User account
1. If you used an existing Gmail account, remember to delete the account with **External Identities | All identity providers**. You can also return to the Google developer console and delete the project that you created.

2. Open Microsoft Entra ID.

3. Go to Users and select **All users**.

4. Select **+ New User**.

5. Choose **Invite external user** from the dropdown menu.

6. Enter the information for the gmail account you set up as a test user for the Google App in Exercise 1 Task 2.

7. Enter a personal message as you want.

8. Select **Review & Invite** then select **Invite**.


| **Security Note** |
| ----: |
| If you are using an existing Gmail account that has Passkeys enable, you will be unable to complete the login processs within the lab environment.  Passkey requires BlueTooth, which cannot be enabled through the VM.  You can still complete the lab, just do these last few tasks in an InPrivate brower running outside the lab environment. |


#### Task 3 - Accept the invitation and login

1. Use an InPrivate browser to log into your gmail account.

2. Open the **Microsoft Invitation on behalf of** in the Inbox.

3. Select the **Accept invitation** link in the message.

3. Enter your username and password as requested in the login dialog (if requested).

   **NOTE** If the ferderation is working correctly, this is where you will see the first results of your new Google External Identity provider.  You will go to the login screen and be able to log in with your gmail credentials.  If the federation is not work, or has not been set up, the user would be sent and ACCOUNT VERIFICATION email after the log in, to confirm the account.  With the federation, no extra verification is needed.

   **NOTE** If you get an access error 500, wait about 30 seconds and refresh the page.  Choose to RESUBMIT.  This error is a timing issue only in the lab environment.

4. Read over the new **Permissions requested by:** message that you get.  This message is coming from your Azure Lab Domain.

5. Choose **Accept**.

6. Once login is complete, you will be sent MyApplications.

#### Task 4 - Login to Microsoft 365 using your Google account

1. Once you have finished the external user invite process of Task 3, you can log directly into Microsoft Online.

2. Open a new tab in the browser you have open.

   **NOTE** if you did not open a new InPrivate browser in Task 3, you should do so for this step.

3. Enter the following web address:

   ```
   login.microsoftonline.com
   ```

4. Select **Sign-in options** on the dialog.
 
5. Choose **Sign in to an organization**.

6. Enter your **lab tenant domain name** in the box and select **Next**.

7. Enter the **Google** email address and password that you created.

At this point, you should see your account passed to Google for confirmation; then enter the Microsoft Office portal.
