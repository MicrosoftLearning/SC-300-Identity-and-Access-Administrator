---
lab:
    title: '02 - Working with tenant properties'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 02: Working with tenant properties

## Lab scenario

You need to identify and update the different properties associated with your tenant.

#### Estimated time: 10 minutes

## Exercise 1 - Changing the tenant display name

### Task 1 - Set the tenant name and technical contact

1. Browse to the [https://portal.azure.com](https://portal.azure.com) and sign in using a Global administrator account for the directory.

2. Select the **Show portal menu** hamburger icon and then select **Azure Active Directory**.

    ![Azure portal menu with Azure Active Directory selected](./media/azure-portal-menu-aad.png)

3. In the left navigation, in the Manage section, select **Properties**.

4. Change the Tenant Properties for the **Name** and **Technical contact** in the dialog.

| **Setting** | **Value** |
| :--- | :--- |
| Name | Contoso Marketing |
| Technical contact | `your Global admin account` |

5. Select **Save** to update the tenant properties.

      ##### You will notice the name change immediately upon completions of the save.

## Task 2 - Review the Country or region and other values associated with your tenant

1. In the **Azure Active Directory** blade, in the Manage section, select **Properties**.

2. Under **Tenant properties**, locate **Country or region** and review the information.

    **IMPORTANT** - When the tenant is created, the Country or region are specified at that time. This setting cannot be changed later.

3. In the **Properties** blade, under **Tenant properties**, locate **Location** and review the information.

    ![Screen image showing the Azure Active Directory Properties blade with the Country or region and Location settings highlighted](./media/azure-active-directory-properties-country-location.png)

## Task 3 - Finding the tenant ID

Azure subscriptions have a trust relationship with Azure Active Directory (Azure AD). Azure AD is trusted to authenticate users, services, and devices for the subscription. Each subscription has a tenant ID associated with it, and there are a few ways you can find the tenant ID for your subscription.

1. In the **Azure Active Directory** blade, in the Manage section, select **Properties**.

2. Under **Tenant properties**, locate **Tenant ID**. This is your unique tenant identifier.

    ![Screen image displaying the Tenant properties page with the Tenant ID box highlighted](./media/portal-tenant-id.png)

## Exercise 2 - Setting your privacy information

### Task 1 - Adding your privacy info on Azure AD, including Global privacy contact and Privacy statement URL

Microsoft strongly recommends you add both your global privacy contact and your organization's privacy statement, so your internal employees and external guests can review your policies. Because privacy statements are uniquely created and tailored for each business, we strongly recommend you contact a lawyer for assistance.

You add your organization's privacy information in the **Properties** area of Azure AD. To access the Properties area and add your privacy information:

1. In the **Azure Active Directory** blade, in the Manage section, select **Properties**.

    ![Screen image displaying tenant properties with the Technical contact, Global contact, and Privacy statement boxes highlighted](./media/properties-area.png)

1. Add your privacy info for your employees:

- **Global privacy contact** - `AllanD@` **your Azure lab domain**
     - Allan Deyoung is a built-in users in your Azure lab tenant who works as an IT Admin, we will use him as the Privacy contact.
     - This person is also who Microsoft contacts if there's a data breach. If there's no person listed here, Microsoft contacts your global administrators.

- **Privacy statement URL** -  `https://github.com/R-C-Stewart/SC-300-Identity-and-Access-Administrator/blob/master/Allfiles/Labs/Lab2/SC-300-Lab_ContosoPrivacySample.pdf`
     - In sample Privacy PDF is provided in your labs directory.
     - Type the link to your organization's document that describes how your organization handles both internal and external guest's data privacy.

    **IMPORTANT** -If you don't include either your own privacy statement or your privacy contact, your external guests will see text in the Review Permissions box that says, **<your org name\>** has not provided links to their terms for you to review. For example, a guest user will see this message when they receive an invitation to access an organization through B2B collaboration.

    ![B2B Collaboration Review permissions box with message](./media/active-directory-no-privacy-statement-or-contact.png)

1. Select **Save**.

### Task 2 - Check your Privacy Statement

1. Return to the Azure Home screen - Dashboard.
2. In the upper-righthand corner of the UI, click on your username.
3. Choose **View account** from the dropdown menu.

     ##### A new browser tab will open automatically.

4. In the **Settings & Privacy** card pick **VIEW SETTINGS AND PRIVACY >**.
5. Select **Privacy**.
6. User **Organization's notice** click the **Veiw** item next to Contoso Marketing organizational privacy statement.

     ##### A new browser tab will open with the Prvacy PDF file you linked to displayed.

7. Review the sample Privacy statement.
8. Close the browser tab with the PDF in it.
9. Close the browser tab displaying the **My Account** items.
