---
lab:
    title: '06 - Add a federated identity provider'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 06: Add a federated identity provider

### You will perform this lab with the tenant login - admind@LODM#####.onmicrosoft.com

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

4. On the New Project page, give the project a name (for example, **MyB2BApp**), and then select **Create**.

5. Open the new project by selecting the link in the Notifications message box or by using the project menu at the top of the page.

6. In the left menu, select **APIs & Services**, and then select **OAuth consent screen**.

7. Under User Type, select **External**, and then select **Create**.

8. On the **OAuth consent screen**, under App information, enter an App name, such as **Microsoft Entra ID**.

9. Under User support email, select an email address. This should include the email address that you used to log into Google.

10. Under Authorized domains, select **+ Add domain**, and then add the microsoftonline.com domain.

   ```
   microsoftonline.com
   ```

11. Under Developer contact information, enter the email address for the lab account that you used to sign into the portal.

12. Select **Save and continue**.

13. In the left menu, select **Credentials**.

14. Select **+ Create credentials**, and then select **OAuth client ID**.

15. In the Application type menu, select Web application. Give the application a suitable name, like Microsoft Entra B2B. Under **Authorized redirect URIs**, add the following URIs:

   ```
      https://login.microsoftonline.com
   ```
      https://login.microsoftonline.com/te/**tenant ID**/oauth2/authresp
       (where <tenant ID> is your tenant ID)
   ```
      https://login.microsoftonline.com/te/**tenant name**.onmicrosoft.com/oauth2/authresp
       (where <tenant name> is your tenant name)
   ```

16. Select **Create**. Copy your **client ID** and **client secret**. You'll use them when you add the identity provider in the Azure portal.

17. You can leave your project at a publishing status of Testing.

#### Task 2 - Add a test user
18. Select the **OAuth consent screen** under APIs and Services menu.

19. In the **Test Users* section of the page, choose **+ Add Users**.

20. Enter the gmail account you created (or are using) for this lab.

21. Select **Save**


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
9. If you used an existing Gmail account, remember to delete the account with **External Identities | All identity providers**. You can also return to the Google developer console and delete the project that you created.

10. Open Microsoft Entra ID.

11. Go to Users and select **All users**.

12. Select **+ New User**.

13. Choose **Invite external user** from the dropdown menu.

14. Enter the information for the gmail account you set up as a test user for the Google App in Exercise 1 Task 2.

15. Enter a personal message as you want.

16. Select **Invite**.

#### Task 3 - Accept the invitation and login
17. Use an InPrivate browser to log into your gmail account.

18. Open the **Microsoft Invitation on behalf of** in the Inbox.

19. Select the **Accept invitation** link in the message.

20. Enter your username and password as requested in the login dialog (if requested).
   **NOTE** If the ferderation is working correctly, this is where you will see the first results of your new Google External Identity provider.  You will go to the login screen and be able to log in with your gmail credentials.  If the federation is not work, or has not been set up, the user would be sent and ACCOUNT VERIFICATION email after the log in, to confirm the account.  With the federation, no extra verification is needed.

   **NOTE** If you get an access error 500, wait about 30 seconds and refresh the page.  Choose to RESUBMIT.  This error is a timing issue only in the lab environment.

21. Read over the new **Permissions requested by:** message that you get.  This message is coming from your Azure Lab Domain.

22. Choose **Accept**.

23. Once login is complete, you will be sent MyApplications.

#### Task 4 - Login to Microsoft 365 using your Google account
24. Once you have finished the external user invite process of Task 3, you can log directly into Microsoft Online.

25. Open a new tab in the browser you have open.
   **NOTE** if you did not open a new InPrivate browser in Task 3, you should do so for this step.

26. Enter the following web address:

   ```
   login.microsoftonline.com
   ```

27. Select **Sign-in options** on the dialog.
 
28. Choose **Sign in to an organization**.

29. Enter your **lab tenant domain name** in the box and select **Next**.

30. Enter the **Google** email address and password that you created.
At this point, you should see your account passed to Google for confirmation; then enter the Microsoft Office portal.
