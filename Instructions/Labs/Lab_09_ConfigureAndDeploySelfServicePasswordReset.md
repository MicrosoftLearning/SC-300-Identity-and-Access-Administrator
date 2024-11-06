---
lab:
    title: '09 - Enable Microsoft Entra self service password reset'
    learning path: '02'
    module: 'Module 02 - Implement an Authentication and Access Management Solution'
---

# Lab 09 - Configure and deploy self-service password reset

### Login type = Microsoft 365 admin

## Lab scenario

The company has decided to empower the employees and enable self-service password reset. You must configure this setting in your organization.

#### Estimated time: 15 minutes

### Exercise 1 - Create a group with SSPR enabled and add users to it

#### Task 1 - Create a group to assign SSPR to

You want to roll out SSPR to a limited set of users first to make sure your SSPR configuration works as expected. Let's create a security group for the limited rollout and add a user to the group.

1. On the Microsoft Entra admin center, open the **Identity** navigation menu on the left.
1. Under **Groups**, select **All groups** and select **New Group** on the right side window.

2. Create a new group using the following information:

    | **Setting**| **Value**|
    | :--- | :--- |
    | Group type| Security|
    | Group name| SSPRTesters|
    | Group description| Testers of SSPR rollout|
    | Membership type| Assigned|
    | Members| Alex Wilber |
    | |  Allan Deyoung |
    | | Bianca Pisani |
  
    
3. Select **Create**.

    ![Screen image displaying the New Group page with group type, group name, and create highlighted](./media/lp2-mod2-create-sspr-security-group.png)

#### Task 2 - Enable SSPR for you test group

Enable SSPR for the group.

1. Browse back to the **Identity** navigation menu.

2. Under **Protection**, select **Password reset**.

3. On the Password reset page Properties page, under **Self service password reset enabled**, select **Selected**.

4. Under **Select group**, replace the existing SSPRSecurityGroupUsers with **SSPRTesters** you just created.

5. On the Password reset page Properties page, select **Save**.

    ![Screen image displaying the Password reset properties page with selected, select group, and save highlighted](./media/lp2-mod2-enable-password-reset-for-selected-group.png)

6. On the **Password reset** screen, look under **Manage*, select and review the default values for each of the **Authentication methods**, **Registration**, **Notifications**, and **Customization** settings.

    **Note** it is important to have **phone** selected as one of the authentication methods for the rest of this lab, but you can have other options as well.

#### Taks 3 - Register for SSPR with Allan

Now that the SSPR configuration is complete, register a mobile phone number for the user you created.

1. Open a different browser or open an InPrivate or Incognito browser session and then browse to [https://aka.ms/ssprsetup](https://aka.ms/ssprsetup).

    This is to ensure you are prompted for user authentication.

2. Sign in as **AllanD@** `<<organization-domain-name>>.onmicrosoft.com` with the password provided.

    **Note** - Replace the organization-domain-name with your domain name.

3. If prompted to update your password, enter a new password of your choice. Be sure to record the new password.

4. If prompted to stay signed in, choose Yes.

5. In the **More information required** dialog box, select **Next**.

6. On the Keep your account secure page, select **Next** to use the Authenticator app.

7. Follow the on screen instructions to set up your account in Authenticator by scanning the QR-code.

8. Complete the process by selecting **Done** when you successfully registered.

  - **Note** - at this point you have both registered for SSPR and MFA in a single step.

11. Close the browser. You do not need to complete the sign in process.

#### Task 4 - Test SSPR

Now let's test whether the user can reset their password.

1. Open a different browser or open an InPrivate or Incognito browser session and then browse to [https://portal.azure.com](https://portal.azure.com).

    This is to ensure you well be prompted for user authentication.

2. Enter **AlexW@** `<<organization-domain-name>>.onmicrosoft.com` and then select **Next**.

    **Note** - Replace the organization-domain-name with your domain name.

3. On the Enter password page, select **Forgot my password**.

4. On the Get back into your account page, complete the requested information and then select **Next**.

5. Follow the on-screen instructions to get the verification code from Microsoft Authenticator app.

6. Enter your verification code and then select **Next**.

7. In the choose a new password step, enter and then confirm your new password.

8. When complete, select **Finish**.

9. Sign in as **AllanD** with the new password you created.

10. Enter your verification code and then verify you can complete the sign in process.

11. When finished, close your browser.

#### Task 5 - What happens if you try a user not in SSPRTesters group?

1. As a test, open a new InPrivate browser window and try to log into the Azure Portal as GradyA, and select **Forgot my password** option.
