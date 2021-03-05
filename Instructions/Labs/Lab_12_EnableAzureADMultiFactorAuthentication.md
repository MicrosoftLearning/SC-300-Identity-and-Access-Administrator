---
lab:
    title: '12 - Enable Azure AD multi-factor authentication'
    learning path: '02'
    module: 'Module 01 - Plan and implement Azure multifactor authentication'
---

# Lab 12 - Enable Azure AD multi-factor authentication

## Lab scenario

To improve security in your organization, you've been directed to enable multi-factor authentication for Azure Active Directory.

#### Estimated time: 10 minutes

>[!IMPORTANT]
>Azure AD Premium is need for this exercise. You can use a 30-day free trial to try this feature out, or just read through the instructions below to understand the flow.

## Configure Multi-Factor Authentication options

1. Browse to the [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

1. Use the search feature and search for **multi-factor**.

1. In the search results, select **Multi-Factor Authentication**.

1. On the Getting started page, under **Configure**, select **Additional cloud-based MFA settings**.

    ![Screenshot showing MFA options in the dashboard](./media/lp2-mod1-set-additional-mfa-settings.png)

1. In the new browser page, you can see the MFA options for Azure users and service settings.

    ![Screenshot showing MFA configuration](./media/lp2-mod1-mfa-settings.png)

    This is where you would select the supported authentication methods, in the screen above, all of them are selected.

    You can also enable or disable app passwords here, which allow users to create unique account passwords for apps that don't support multi-factor authentication. This feature lets the user authenticate with their Azure AD identity using a different password specific to that app.

## Setup conditional access rules for MFA

Next let's examine how to set up Conditional Access policy rules that would enforce MFA for guest users accessing specific apps on your network.

1. Switch back to the Azure portal and select **Azure Active Directory** > **Security** > **Conditional access**.

1. On the menu, select **New policy**.

    ![creenshot highlighting the New Policy button in the Azure portal](./media/lp2-mod1-azure-ad-conditional-access-policy.png)

1. Name your policy, for example **All guests**.

1. Select **Users and group**.

    - Select **Select users and groups**  
    - Select the **All guest and external users** check box to apply this to all guests.  
    - Select **Done**.  

1. Select **Cloud apps or actions**.

    - Select **Select apps**.  
    - Choose an app you want to enable Azure AD MFA such as Visual Studio App Center.  
    - Select **Select** and then select **Done**.

1. Review the Conditions section.

    - Select **Locations** and then configure it for **Any location**.

1. Under **Access Controls** select **Grant** and verify **Grant access** is selected.

1. Select the **Require multi-factor authentication** check box to enforces MFA.

1. Select **Select**.

1. Set **Enable policy** to **On**.

1. Select **Create to create the policy**.

    ![Screenshot showing the complete Add Policy dialog](./media/lp2-mod1-conditional-access-new-policy-complete.png)

    MFA is now enabled for your selected application(s). The next time a guest tries to sign into that app they will be prompted to register for MFA.

## Configure Azure AD MFA for passwords

Finally, let's look at how to configure MFA for user accounts. This is another way to get to the multi-factor auth settings.

1. Switch back to the Azure Active Directory dashboard in the Azure portal.

1. Select **Users**.

1. At the top of the Users pane, select **Multi-Factor Authentication**.

    ![Screenshot showing the MFA option](./media/lp2-mod1-users-mfa.png)

    You can enable or disable MFA on a user basis by selecting a user and then using the quick steps on the right side.

    ![Screenshot showing the MFA options](./media/lp2-mod1-mfa-service-settings-and-users.png)

1. Select **service settings**.  
    This displays the same global MFA options we saw earlier. Let's explore these in a bit more detail.
