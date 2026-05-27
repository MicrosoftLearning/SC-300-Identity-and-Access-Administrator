---
lab:
  title: 18 - Defender for Cloud Apps Access Policies
  learning path: '03'
  module: Module 03 - Implement Access Management for Apps
  description: Microsoft Defender for Cloud Apps allows us to create additional Conditional Access policies specific to the cloud apps that we are monitoring. Creating these policies can be done from within the Control menu within the Microsoft Defender for Cloud Apps portal.
  duration: 20 minutes
  level: 200
  islab: true
  primarytopics:
    - Microsoft Defender
    - Microsoft Defender for Cloud
    - Microsoft Defender for Cloud Apps
---

# 18 - Defender for Cloud Apps Access and Session Policies

### Login type = Microsoft 365 admin

## Lab scenario

Microsoft Defender for Cloud Apps  allows us to create additional Conditional Access policies specific to the cloud apps that we are monitoring.  Creating these policies can be done from within the Control menu within the Microsoft Defender for Cloud Apps  portal.

#### Estimated time: 20 minutes

### Exercise 1 - Create and test the Conditional Access App Contol policy

#### Task 1 – Confirm that PradeepG has unconditional access to Microsoft Forms

1. Launch a new **InPrivate browsing** window.

1. Go to **Microsoft Forms** at **`https://forms.microsoft.com`**.

1. Select **Sign in** in the upper-right corner of the page.

1. Sign in as **Pradeep Gupta**.

   - **Username**: `PradeepG@<your lab hoster–provided domain>`
   - **Password**: Use the password from the **Resources** tab.

1. Confirm that Microsoft Forms opens and that no warning messages are displayed.

1. Close the InPrivate browsing window.

#### Task 2 - Configure Microsoft Entra ID to work with Defender for Cloud Apps

1. Sign in to **Microsoft Entra admin center** at **`https://entra.microsoft.com`** using a Global Administrator account.

    > **Note:** You may be prompted to complete Multi-Factor Authentication (MFA) during sign-in. Follow the prompts to configure or verify your authentication method before continuing.

1. In the left navigation, under **Entra ID**, select **Conditional access**.

1. On the **Overview**, select **+ Create new policy**.

1. Enter a policy name, such as **Monitor Pradeep using Forms**.

1. Under **Assignments**, select **0 users or agents(Preview) selected**.

1. On the Include tab, select **Select users and groups**, and then mark **Users and groups** check box.

1. In the **Select users and groups** pane, select **Pradeep Gupta** account and then select **Select**.

1. In the **Target resources**, select **No target resource selected**.

1. Verify **Resources (formerly cloud apps)** is selected and then select **Select resources**, then in the **Select specific resources** select **None**.

1. In the **Resources** pane, search for **Microsoft Forms** and select **Microsoft Forms** and then select **Select**.

1. Under **Access controls**, in the **Session** section, select **0 controls selected**.

1. Select the **Use Conditional Access App Control** box, set the mode to **Monitor only**, and then select **Select**.

1. Under **Enable policy**, select **On**, and select **Create**.

#### Task 3 – Sign in to Microsoft Forms and confirm Conditional Access monitoring

1. Open a new **InPrivate browsing** window.

1. Go to **Microsoft Forms** at **`https://forms.microsoft.com`**.

1. In the upper-right corner, select **Sign in**.

1. Sign in as **Pradeep Gupta**.

   - **Username**: `PradeepG@<your lab hoster–provided domain>`
   - **Password**: Use the password from the **Resources** tab.

1. Confirm that Pradeep has access and that the following message is displayed:
   - *Your company is monitoring the usage of this application.*

1. Close the InPrivate browsing window.

### Exercise summary

In this exercise, you created a Conditional Access App Control policy that routes a user's session through Microsoft Defender for Cloud Apps and validated the monitoring message. This exercise showed how session-level controls protect data in sanctioned applications.

### Exercise 2 - Setup alerts in Microsoft Defender for Cloud Apps

#### Task 1 - Access Microsoft Defender for Cloud Apps and create Conditional Access App Control

Registering your application establishes a trust relationship between your app and the Microsoft identity platform. The trust is unidirectional: Your app trusts the Microsoft identity platform—not the other way around.

1. Sign in to **Microsoft Defender portal** at **`https://security.microsoft.com`** using a **Global Administrator** account.

1. On the left menu, scroll to and select **Polices** in the **Cloud Apps** section of the menu on the left..

1. In the **Policies** menu, locate and select **Policy Management**.

1. Select **+ Create policy**. Select **Access policy**.

1. Enter a name for the policy, such as **Monitor Microsoft Forms access**.

1. Leave the **Category** as **Access control**.

1. Under **Activities matching all of the following**, select the drop-down for **Intune compliant, Microsoft Entra Hybrid joined** and unselect **Microsoft Entra Hybrid joined**.

1. Select the drop-down for **Select apps**.  Select **Microsoft Forms**.

1. Leave **Actions** as **Test**.

1. Under **Alerts**, leave **Create an alert...** checked and select **Send alert as email**.

1. Enter the lab admin email address and select **Enter** on your keyboard.

1. Select **Create** to create the access policy.

#### Task 2: Sign in to Microsoft Forms as Pradeep to trigger activity

1. Open a new **InPrivate** browsing window.

1. Go to **Microsoft Forms** at **`https://forms.microsoft.com`**.

1. In the upper-right corner, select **Sign in**.

1. Sign in as **Pradeep Gupta**:

   - **Username**: `PradeepG@<lab-hoster-domain>`

   - **Password**: From the **Resources** tab.

1. Confirm that Pradeep can access the service and that a message is displayed indicating company monitoring or usage of the application.

1. Close the **InPrivate** browsing window.

#### Task 3 - Review the Activity in Defender for Cloud Apps

1. Return to the browser running Defender for Cloud Apps.

1. Refresh the browser to ensure the most recent data is downloaded.

1. From the **Investigate** menu, select **Activity log**.

1. Using the **App: filter** pick **Microsoft Forms** from the list.

1. Notice the sign-on records for Pradeep.

### Exercise summary

In this exercise, you created an access policy with email alerts in Microsoft Defender for Cloud Apps and reviewed the resulting activity log. This exercise showed how to surface suspicious activity for investigation and response.
