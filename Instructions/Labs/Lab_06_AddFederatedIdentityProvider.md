---
lab:
  title: 06 - Add a federated identity provider
  learning path: '01'
  module: Module 01 - Implement an identity management solution
  description: Add and external federated identity provide to your Microsoft Entra tenant.
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

**Important Note** - For this exercise, you will need a Gmail account on Google. Create a **new Google account** and then follow the steps for the exercise.  Be sure to note the email address and password, they are necessary to complete the lab.

1. Go to the Google APIs at `https://console.developers.google.com`, and sign in with your Google account. We recommend that you use a shared team Google account.

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

1. Within the **Authorized JavaScript origins**, select the **+ Add URI** button.

1. Enter the URI `https://microsoftonline.com` for the value.

1. Within the **Authorized redirect URIs**, select **+ Add URI** button.  You will need to add three different URI's in this section:

    - **First URI** = `https://login.microsoftonline.com`
    - **Second URI** = `https://login.microsoftonline.com/te/**tenant ID**/oauth2/authresp` (where <tenant ID> is your tenant ID)
    - **Third URI** = `https://login.microsoftonline.com/te/**tenant name**.onmicrosoft.com/oauth2/authresp` (where <tenant name> is your tenant name)

    **Lab Tip** - you may find this step easier if you use Notepad in the lab VM to create these URI, and then copy and paste from there.

    **Lab Tip 2** - Results should look similar to this, with your Tenant ID and Tenant Name.

    | URI # | Link |
    | :--- | :--- |
    | URIs 1 | https://login.microsoftonline.com |
    | URIs 2 | https://login.microsoftonline.com/te/aaaa1111bbbb2222cccc/oauth2/authresp |
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

1. Microsoft provides a direct federation for **Google** as an identity provider.  This can be initiated by selecting **+ Google** from the **External Identities | All identity providers** page
 
1. After selecting + Google, another page will open with additional information that is required to configure Google as an identity provider.  

1. Enter the **Client ID** and **Client secret** you obtained earlier.

1. Select **Save**.

This completes the configuration of Google as an identity provider.

#### Task 2 - Invite you Test User account

1. If you used an existing Gmail account, remember to delete the account with **External Identities | All identity providers**. You can also return to the Google developer console and delete the project that you created.

1. In the left navigation menu, under **Entra ID**, select **Users**.

1. Open the **All users** menu item, then select **+ New User**.

1. Select **Invite external user** from the dropdown menu.

1. Enter the information for the gmail account you set up as a test user for the Google App in Exercise 1 Task 2.

1. Enter a personal message as you want.

1. Select **Review & Invite** then select **Invite**.

    | **Security Note** |
    | ----: |
    | If you are using an existing Gmail account that has Passkeys enable, you will be unable to complete the login processs within the lab environment.  Passkey requires BlueTooth, which cannot be enabled through the VM.  You can still complete the lab, just do these last few tasks in an InPrivate brower running outside the lab environment. |


#### Task 3 - Accept the invitation and login

1. Use an InPrivate browser to log into your gmail account.

1. Open the **Microsoft Invitation on behalf of** in the Inbox.

1. Select the **Accept invitation** link in the message.

1. Enter your username and password as requested in the login dialog (if requested).

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
   login.microsoftonline.com
   ```

1. Select **Sign-in options** on the dialog.
 
1. Choose **Sign in to an organization**.

1. Enter your **lab tenant domain name** in the box and select **Next**.

1. Enter the **Google** email address and password that you created.

At this point, you should see your account passed to Google for confirmation; then enter the Microsoft Office portal.

### Exercise summary

In this exercise, you configured Google as a federated identity provider in Microsoft Entra ID, invited a Gmail user, and validated sign-in. This exercise showed how federation lets external users access your tenant with their existing identities.
