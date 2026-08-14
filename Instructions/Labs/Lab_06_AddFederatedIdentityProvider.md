---
lab:
  title: 06 - Add a federated identity provider
  learning path: '01'
  module: Module 01 - Implement an identity management solution
    description: Add an external federated identity provider to your Microsoft Entra tenant.
  duration: 25 minutes
  level: 300
  islab: true
---

# Lab 06: Add a federated identity provider

### Login type: Microsoft 365 admin

## Lab scenario

Your company works with many vendors and, on occasion, you need to add some vendor accounts to your directory as a guest and allow them to use their Google account to sign-in.

#### Estimated time: 25 minutes

### Exercise 1 - Configure identity providers

#### Task 1 - Configure Google to be used as an identity provider

> **Important:** This exercise requires a learner-owned Google account that you can sign in to and access its Gmail inbox. Do not use a shared account. If you don't have an appropriate test account, review the Google configuration steps without entering credentials and continue when an account is available.

1. Go to Google Cloud Console at `https://console.developers.google.com`.

1. Before entering Google credentials, verify that the sign-in page is hosted at `accounts.google.com`, and then sign in with your test Google account.

1. Accept the terms of service if you're prompted to do so.

   **Create a new project:**
1. At the top of the page, select the project menu to open the Select a project page. Choose **New Project**.  Leave the remaining fields with the default settings.

1. On the New Project page, give the project a name: `MyB2BApp`, and then select **Create**.

1. Open the new project by selecting the link in the Notifications message box or by using the project menu at the top of the page.

1. In the left menu, select **APIs & Services**, and then select **OAuth consent screen**.

1. Select the **Get Started** button.

1. On the Application information screen enter the following information:

    | Section | Field Name | Value |
    | :---    | :---    | :---  |
    | 1 App Information | | |
    |            | App name | `Microsoft Entra ID` |
    |            | User support email | Select the email name from the drop down |
    | 2 Audience | | |
    |            | Internal / External | **External** |
    | 3 Contact Information | | |
    |            | Email addresses | Use the same email address as above |
    | 4 Finish | | |
    |            | Agreement | Mark the checkbox |

1. Select the **Create** button to continue.

1. Select the **Create OAuth client** button.

1. Choose **Application type = Web Application**.

1. Accept the default name for the application.

1. Within the **Authorized redirect URIs**, select **+ Add URI** button.  You will need to add three different URI's in this section:

    - **First URI** = `https://login.microsoftonline.com`
    - **Second URI** = `https://login.microsoftonline.com/te/<tenant-ID>/oauth2/authresp` (where `<tenant-ID>` is your Microsoft Entra tenant ID)
    - **Third URI** = `https://login.microsoftonline.com/te/<tenant-name>.onmicrosoft.com/oauth2/authresp` (where `<tenant-name>` is your tenant name)

    **Lab Tip** - you may find this step easier if you use Notepad in the lab VM to create these URI, and then copy and paste from there.

    **Lab Tip 2** - Results should look similar to this, with your Tenant ID and Tenant Name.

    | URI # | Link |
    | :--- | :--- |
    | URIs 1 | https://login.microsoftonline.com |
    | URIs 2 | https://login.microsoftonline.com/te/11111111-2222-3333-4444-555555555555/oauth2/authresp |
    | URIs 3 | https://login.microsoftonline.com/te/MyTenantName.onmicrosoft.com/oauth2/authresp |

1. Select the **Create** button.

1. When the item is created, copy the **Client ID** and the **Client Secret** into Notepad for use later.

1. You can leave your project in this state, we don't need to publish.

#### Task 2 - Add a test user

1. From the menu on the left, select the **Audience** item.

1. In the **Test Users** section of the page, choose **+ Add Users**.

1. Enter the gmail account you are using for this lab.

1. Select **Save**

#### Task 3 - Add authorized domain to Branding

1. From the menu on the left, select the **Branding** item.

1. Scroll to the very bottom of the page.

1. In the **Authorized domains** section, add the domain **microsoftonline.com**.

1. In the **Developer contact information** add the email address you are using for this lab.

1. Select **Save**.

### Exercise summary

In this exercise, you registered a Google project and prepared OAuth client credentials so it can be used as an external identity provider. This exercise showed how the upstream identity provider is set up before federating with Microsoft Entra ID.

### Exercise 2 - Configure Azure to work with an External identity provider

#### Task 1 - Configure Microsoft Entra ID for Google federation

1. Sign in to **Microsoft Entra admin center** at **`https://entra.microsoft.com`** as your Global Administrator.

    > **Note:** You may be prompted to complete Multi-Factor Authentication (MFA) during sign-in. Follow the prompts to configure or verify your authentication method before continuing.

1. In the left navigation menu, under **Entra ID**, select **External Identities**.

1. Select **All identity providers** from the menu on the left.

1. In the **Google** row, select **Configure**.
 
1. After selecting + Google, another page will open with additional information that is required to configure Google as an identity provider.  

1. Enter the **Client ID** and **Client secret** you obtained earlier.

1. Select **Save**.

This completes the configuration of Google as an identity provider.

#### Task 2 - Invite your test user account

1. In the left navigation menu, under **Entra ID**, select **Users**.

1. Open the **All users** menu item, then select **+ New User**.

1. Select **Invite external user** from the dropdown menu.

1. Enter the information for the gmail account you set up as a test user for the Google App in Exercise 1 Task 2.

1. Enter a personal message as you want.

1. Select **Review + invite**, then select **Invite**.

    | **Security Note** |
    | ----: |
    | If the Gmail account has passkeys enabled, complete the remaining tasks in an InPrivate browser outside the lab VM. Passkey authentication might require Bluetooth or device capabilities that aren't available through the VM. |


#### Task 3 - Accept the invitation and login

1. Use an InPrivate browser to log into your gmail account.

1. Open the **Microsoft Invitation on behalf of** in the Inbox.

1. Select the **Accept invitation** link in the message.

1. Verify that the authentication page redirects to `accounts.google.com` before entering your Google username or password. Then sign in if prompted.

    >**Note:** If the federation is working correctly, this is where you will see the first results of your new Google External Identity provider.  You will go to the login screen and be able to log in with your gmail credentials.  If the federation is not working, or has not been set up, the user would be sent an ACCOUNT VERIFICATION email after the log in, to confirm the account.  With the federation, no extra verification is needed.

    >**Note:** If you get an access error 500, wait about 30 seconds and refresh the page.  Choose to RESUBMIT.  This error is a timing issue only in the lab environment.

1. Read over the new **Permissions requested by:** message that you get.  This message is coming from your Azure Lab Domain.

1. Choose **Accept**.

1. Once login is complete, you will be sent MyApplications.

#### Task 4 - Login to Microsoft 365 using your Google account

1. Once you have finished the external user invite process of Task 3, you can log directly into Microsoft Online.

1. Open a new tab in the browser you have open.

    >**Note:** if you did not open a new InPrivate browser in Task 3, you should do so for this step.

1. Enter the following web address:

   ```
    https://login.microsoftonline.com
   ```

1. Select **Sign-in options** on the dialog.
 
1. Choose **Sign in to an organization**.

1. Enter your **lab tenant domain name** in the box and select **Next**.

1. Enter the Google email address. Before entering its password, verify that authentication has redirected to `accounts.google.com`, and then complete Google sign-in.

At this point, you should see your account passed to Google for confirmation; then enter the Microsoft Office portal.

#### Task 5 - Clean up the test configuration

1. After completing the federation tests, return to **External Identities** > **All identity providers** and remove the Google identity provider configuration created for this lab.

1. Return to Google Cloud Console and delete the `MyB2BApp` project if you no longer need it.

### Exercise summary

In this exercise, you configured Google as a federated identity provider in Microsoft Entra ID, invited a Gmail user, and validated sign-in. This exercise showed how federation lets external users access your tenant with their existing identities.
