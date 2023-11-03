---
lab:
    title: '19 - Register an application'
    learning path: '03'
    module: 'Module 03 - Implement Access Management for Apps'
---

# Lab 19 - Register an application

#### Estimated time: 30 minutes

### Exercise 1 - Register an application

#### Task 1 - App registration

Registering your application establishes a trust relationship between your app and the Microsoft identity platform. The trust is unidirectional: Your app trusts the Microsoft identity platform—not the other way around.

1. Sign in to [https://entra.microsoft.com](https://entra.microsoft.com) using a Global Administrator account.

2. Open the portal menu and then select **Microsoft Entra ID**.

3. On the **Identity** menu, under **Applications**, select **App registrations.**

4. On the **App registrations** page, on the menu, select **+ New registration**.

5. On the **register an application** blade, register an app named **Demo app** using the default values. You do not need to enter the redirect URI.

    ![Screen image displaying the Register an application page with the name and default settings highlighted](./media/lp3-mod3-register-an-application.png)

6. When complete, you will be directed to the **Demo app** page.


#### Task 2 - Configure platform settings

Settings for each application type, including redirect URIs, are configured in **Platform configurations** in the Azure portal. Some platforms, like **Web** and **Single-page applications**, require you to manually specify a redirect URI. For other platforms, like mobile and desktop, you can select from redirect URIs generated for you when you configure their other settings.

To configure application settings based on the platform or device you're targeting:

Add and modify redirect URIs for your registered applications by configuring their platform settings.

1. Select your application in **App registrations** in the Microsoft Entra admin center.

2. Under **Manage**, select **Authentication**.

3. Under **Platform configurations**, select **+ Add a platform**.

4. In **Configure platforms**, select the tile for your application type (platform) to configure its settings.

    ![Screenshot of the Platform configuration pane in the Azure portal](./media/configure-platforms.png)

    | Platform| Configuration settings|
    | :--- | :--- |
    | Web| Enter a **Redirect URI** for your app, the location where Microsoft identity platform redirects a user's client and sends security tokens after authentication. Select this platform for standard web applications that run on a server.|
    | Single-page application| Enter a **Redirect URI** for your app, the location where Microsoft identity platform redirects a user's client and sends security tokens after authentication. Select this platform if you're building a client-side web app in JavaScript or with a framework like Angular, Vue.js, React.js, or Blazor WebAssembly.|
    | iOS/macOS| Enter the app **Bundle ID**, found in XCode in *Info.plist* or Build Settings. A redirect URI is generated for you when you specify a Bundle ID.|
    | Android| Enter the app **Package name**, which you can find in the AndroidManifest.xml file, and generate and enter the **Signature hash**. A redirect URI is generated for you when you specify these settings.|
    | Mobile and desktop applications| Select one of the **Suggested redirect URIs** or specify a **Custom redirect URI**. For desktop applications, we recommend: [https://login.microsoftonline.com/common/oauth2/nativeclient](https://login.microsoftonline.com/common/oauth2/nativeclient). Select this platform for mobile applications that aren't using the latest Microsoft Authentication Library (MSAL) or are not using a broker. Also select this platform for desktop applications.|

5. Select **Configure** to complete the platform configuration.

#### Task 3 - Add credentials, certificate and client secret

Credentials are used by confidential client applications that access a web API. Examples of confidential clients include web apps, other web APIs, and service-type and daemon-type applications. Credentials allow your application to authenticate as itself, requiring no interaction from a user at runtime.

You can add both certificates and client secrets (a string) as credentials to your confidential client app registration.

![Screenshot of Azure portal showing the Certificates and secrets pane in app registration](./media/portal-05-app-reg-04-credentials.png)

    **Note**: Sometimes called a *public key*, certificates are the recommended credential type, because as they provide a higher level of assurance than a client secret. When using a trusted public certificate, you can add the certificate using the Certificates & secrets feature. Your certificate must be one of the following file types: .cer, .pem, .crt.


    **Note**: The client secret, also known as an *application password*, is a string value your app can use in place of a certificate to identity itself. It's the easier of the two credential types to use. It's often used during development, but is considered less secure than a certificate. You should use certificates in your applications running in production.

1. Select your application in **App registrations** in the Azure portal.

2. Select **Certificates & secrets**, then **+ New client secret**.

3. Add a description for your client secret.

4. Select a duration.

5. Select **Add**.

6. **Save the secret's value in notepad** for use in your client application code; The Certificate & Secrets page will display the new secret value. It's important you copy this value as it's only shown this one time; if you refresh your page and come back, it will only show as a masked value.

7. Skip the **Add a redirect URI** and **Configure platform settings** sections. You don't need to configure a redirect URI for a web API since no user is logged in interactively.

8. Skip the **Add credentials** section for now. Only if your API accesses a downstream API would it need its own credentials—a scenario not covered in this article.

With your web API registered, you're ready to add the scopes that your API's code can use to provide granular permission to consumers of your API.


#### Task 5 - Add a scope

The code in a client application requests permission to perform operations defined by your web API by passing an access token along with its requests to the protected resource (the web API). Your web API then performs the requested operation only if the access token it receives contains the scopes (also known as application permissions) required for the operation.

First, follow these steps to create an example scope named Employees.Read.All:

1. Sign in to the Microsoft Entra admin center.

2. If you have access to multiple tenants, use the **Directory + subscription** filter in the top menu to select the tenant containing your client app's registration.

3. Select **Identity**, then **Application ** and finally select **App registrations**, and then select your API's app registration.

4. Select **Expose an API**, then **+ Add a scope**.

    ![An app registration's Expose an API pane in the Azure portal](./media/portal-02-expose-api.png)

5. You're prompted to set an **Application ID URI** if you haven't yet configured one. The App ID URI acts as the prefix for the scopes you'll reference in your API's code, and it must be globally unique. You can use the default value provided, which is in the form api://\<application-client-id\>, or specify a more readable URI like `https://contoso.com/api`.

6. Select **Save and continue**.

6. Next, specify the scope's attributes in the **Add a scope pane**. For this walk-through, you can use the example values or specify your own.

    | Field| Description| Example|
    | :--- | :--- | :--- |
    | Scope name| The name of your scope. A common scope naming convention is resource.operation.constraint.| Employees.Read.All|
    | Who can consent| Whether this scope can be consented to by users or if admin consent is required. Select Admins only for higher-privileged permissions.| Admins and users|
    | Admin consent display name| A short description of the scope's purpose that only admins will see.| Read-only access to employee records|
    | Admin consent description| A more detailed description of the permission granted by the scope that only admins will see.| Allow the application to have read-only access to all employee data.|
    | User consent display name| A short description of the scope's purpose. Shown to users only if you set Who can consent to Admins and users.| Read-only access to your employee records|
    | User consent description| A more detailed description of the permission granted by the scope. Shown to users only if you set Who can consent to Admins and users.| Allow the application to have read-only access to your employee data.|

7. Set the **State** to **Enabled**, and then select **Add scope**.

8. (Optional) To suppress prompting for consent by users of your app to the scopes you've defined, you can *pre-authorize* the client application to access your web API. Pre-authorize *only* those client applications you trust since your users won't have the opportunity to decline consent.

   1. Under **Authorized client applications**, select **Add a client application.**

   2. Enter the **Application (client) ID** of the client application you want to pre-authorize. For example, that of a web application you've previously registered.

   3. Under **Authorized scopes**, select the scopes for which you want to suppress consent prompting, then select **Add application**.

   4. If you followed this optional step, the client app is now a pre-authorized client app (PCA), and users won't be prompted for their consent when signing into it.

#### Task 6 - Add a scope requiring admin consent

Next, add another example scope named Employees.Write.All that only admins can consent to. Scopes that require admin consent are typically used for providing access to higher-privileged operations, often by client applications that run as backend services or daemons that don't sign in a user interactively.

1. To add the Employees.Write.All example scope, follow the steps above and specify these values in the **Add a scope** pane:

    | Field| Example value|
    | :--- | :--- |
    | Scope name| Employees.Write.All|
    | Who can consent| Admins only|
    | Admin consent display name| Write access to employee records|
    | Admin consent description| Allow the application to have write access to all employee data.|
    | User consent display name| None (leave empty)|
    | User consent description| None (leave empty)|

    >**Note**: If you successfully added both example scopes described in the previous sections, they'll appear in the **Expose an API** pane of your web API's app registration, similar to this image:

    ![Screenshot of the Expose an API pane showing two exposed scopes.](./media/portal-03-scopes-list.png)

    As shown in the image, a scope's full string is the concatenation of your web API's **Application ID URI** and the scope's **Scope name**.

        **Note**: For example, if your web API's application ID URI is `https://contoso.com/api` and the scope name is Employees.Read.All, the full scope is: `https://contoso.com/api/Employees.Read.All`


        **Note**: Next, you will configure a client app's registration with access to your web API and the scopes you defined by following the steps above.
    Once a client app registration is granted permission to access your web API, the client can be issued an OAuth 2.0 access token by the Microsoft identity platform. When the client calls the web API, it presents an access token whose scope (scp) claim is set to the permissions you've specified in the client's app registration. You can expose additional scopes later as necessary. Consider that your web API can expose multiple scopes associated with several operations. Your resource can control access to the web API at runtime by evaluating the scope (scp) claim(s) in the OAuth 2.0 access token it receives.


### Exercise 2 - Manage app registration with a custom role

#### Task 1 - Create a new custom role to grant access to manage app registrations

You need to create a new custom role for app management. This new role should be limited to only the specific permissions required to perform credential management.

1. Sign in to the [https://entra.microsoft.com](https://entra.microsoft.com) using a Global administrator account.

2. Open the portal menu and then select **Microsoft Entra ID**.

3. On the lefthand menu, under **Identity**, select **Roles and administrators**.

4. Then select **Roles & admins** item, then select **+ New custom role**.

    ![Screen image displaying the Roles and administrators blade with the New custom role menu option highlighted](./media/lp3-mod1-new-custom-role.png)

5. In the New custom role dialog, on the Basics tab, in the name box, enter **My custom app role**.

6. Review the remaining options and then select **Next**.

7. On the Permissions tab, review the available permissions.

8. In the **Search by permission name or description** box, enter **credentials**.

9. In the results, select the **Manage** permissions and then select **Next**.

    ```
       microsoft.directory/servicePrincipals/managePasswordSingleSignOnCredentials  -   Manage password single sign-on credentials or service principals.
       microsoft.directory/servicePrincipals/synchronizationCredentials/manage    -   Manage application provisioning secrets and credentials.
    ```

    ![Screen image displaying the New custom role Permissions tab with search, manage permissions, and Next highlighted](./media/lp3-mod1-custom-role-permissions.png)

    **Why pick those two** - For application provisionsing these two items are the bare minimum permissions needed to enable and enforce single sign-on for the application or service principal being created; and be able to assign the enterise application to a set of users or groups.  Other permissions could also be granted.  You can get a full list of available permissions at `https://docs.microsoft.com/azure/active-directory/roles/custom-enterprise-app-permissions`.

10. Review the changes and then select **Create**.

