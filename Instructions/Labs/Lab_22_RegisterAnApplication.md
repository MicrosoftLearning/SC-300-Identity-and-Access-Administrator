---
lab:
    title: '22 - Register an application'
    learning path: '03'
    module: 'Module 03 - Implement app registrations'
---

# Lab 22 - Register an application

#### Estimated time: 20 minutes

## Register an application

Registering your application establishes a trust relationship between your app and the Microsoft identity platform. The trust is unidirectional: Your app trusts the Microsoft identity platform—not the other way around.

1. Sign in to [https://portal.azure.com](https://portal.azure.com) using a Global Administrator account.

1. Open the portal menu and then select **Azure Active Directory**.

1. On the **Azure Active Directory** blade, under **Manage**, select **App registrations.**

1. On the **App registrations** page, on the menu, select **+ New registration**.

1. On the **register an application** blade, register an app named **Demo app** using the default values. You do not need to enter the redirect URI.

    ![Screen image displaying the Register an application blade with the name and default settings highlighted](./media/lp3-mod3-register-an-application.png)

1. When complete, click **Register**. You will then be directed to the **Demo app** blade.

## Add a redirect URI

A redirect URI is the location where the Microsoft identity platform redirects a user's client and sends security tokens after authentication. In a production web application, for example, the redirect URI is often a public endpoint where your app is running. During development, it's common to also add the endpoint where you run your app locally.

**Note** You can add and modify redirect URIs for your registered applications by configuring their platform settings.

## Configure platform settings

Settings for each application type, including redirect URIs, are configured in **Platform configurations** in the Azure portal. Some platforms, like **Web** and **Single-page applications**, require you to manually specify a redirect URI. For other platforms, like mobile and desktop, you can select from redirect URIs generated for you when you configure their other settings.

To configure application settings based on the platform or device you're targeting:

1. Your browser should be on the **Demo app** page.

1. Under **Manage**, select **Authentication**.

1. Under **Platform configurations**, select **Add a platform**.

1. In **Configure platforms**, select the tile for your application type (platform) to configure its settings.

    ![Screenshot of the Platform configuration pane in the Azure portal](./media/configure-platforms.png)

    | Platform| Configuration settings|
    | :--- | :--- |
    | Web| Enter a **Redirect URI** for your app, the location where Microsoft identity platform redirects a user's client and sends security tokens after authentication. Select this platform for standard web applications that run on a server.|
    | Single-page application| Enter a **Redirect URI** for your app, the location where Microsoft identity platform redirects a user's client and sends security tokens after authentication. Select this platform if you're building a client-side web app in JavaScript or with a framework like Angular, Vue.js, React.js, or Blazor WebAssembly.|
    | iOS/macOS| Enter the app **Bundle ID**, found in XCode in *Info.plist* or Build Settings. A redirect URI is generated for you when you specify a Bundle ID.|
    | Android| Enter the app **Package name**, which you can find in the AndroidManifest.xml file, and generate and enter the **Signature hash**. A redirect URI is generated for you when you specify these settings.|
    | Mobile and desktop applications| Select one of the **Suggested redirect URIs** or specify a **Custom redirect URI**. For desktop applications, we recommend: [https://login.microsoftonline.com/common/oauth2/nativeclient](https://login.microsoftonline.com/common/oauth2/nativeclient). Select this platform for mobile applications that aren't using the latest Microsoft Authentication Library (MSAL) or are not using a broker. Also select this platform for desktop applications.|

1. Select **Configure** to complete the platform configuration.

## Add credentials

Credentials are used by confidential client applications that access a web API. Examples of confidential clients include web apps, other web APIs, and service-type and daemon-type applications. Credentials allow your application to authenticate as itself, requiring no interaction from a user at runtime.

You can add both certificates and client secrets (a string) as credentials to your confidential client app registration.

![Screenshot of Azure portal showing the Certificates and secrets pane in app registration](./media/portal-05-app-reg-04-credentials.png)

## Add a certificate

Sometimes called a *public key*, certificates are the recommended credential type, because as they provide a higher level of assurance than a client secret. When using a trusted public certificate, you can add the certificate using the Certificates & secrets feature. Your certificate must be one of the following file types: .cer, .pem, .crt.

## Add a client secret

The client secret, also known as an *application password*, is a string value your app can use in place of a certificate to identity itself. It's the easier of the two credential types to use. It's often used during development, but is considered less secure than a certificate. You should use certificates in your applications running in production.

1. Select your application in **App registrations** in the Azure portal.

1. Select **Certificates & secrets** > **New client secret**.

1. Add a description for your client secret.

1. Select a duration.

1. Select **Add**.

1. **Record the secret's value** for use in your client application code; It's *never displayed again* after you leave this page.

## Register the web API

To provide scoped access to the resources in your web API, you must first register the API with the Microsoft identity platform.

1. Perform the steps above.

1. Skip the **Add a redirect URI** and **Configure platform settings** sections. You don't need to configure a redirect URI for a web API since no user is logged in interactively.

1. Skip the **Add credentials** section for now. Only if your API accesses a downstream API would it need its own credentials—a scenario not covered in this article.

With your web API registered, you're ready to add the scopes that your API's code can use to provide granular permission to consumers of your API.

## Add a scope

The code in a client application requests permission to perform operations defined by your web API by passing an access token along with its requests to the protected resource (the web API). Your web API then performs the requested operation only if the access token it receives contains the scopes (also known as application permissions) required for the operation.

First, follow these steps to create an example scope named Employees.Read.All:

1. Sign in to the Azure portal.

1. If you have access to multiple tenants, use the **Directory + subscription** filter in the top menu to select the tenant containing your client app's registration.

1. Select **Azure Active Directory** > **App registrations**, and then select your API's app registration.

1. Select **Expose an API** > **Add a scope**.

    ![An app registration's Expose an API pane in the Azure portal](./media/portal-02-expose-api.png)

1. You're prompted to set an **Application ID URI** if you haven't yet configured one. The App ID URI acts as the prefix for the scopes you'll reference in your API's code, and it must be globally unique. You can use the default value provided, which is in the form api://\<application-client-id\>, or specify a more readable URI like `https://contoso.com/api`.

1. Next, specify the scope's attributes in the **Add a scope pane**. For this walk-through, you can use the example values or specify your own.

    | Field| Description| Example|
    | :--- | :--- | :--- |
    | Scope name| The name of your scope. A common scope naming convention is resource.operation.constraint.| Employees.Read.All|
    | Who can consent| Whether this scope can be consented to by users or if admin consent is required. Select Admins only for higher-privileged permissions.| Admins and users|
    | Admin consent display name| A short description of the scope's purpose that only admins will see.| Read-only access to employee records|
    | Admin consent description| A more detailed description of the permission granted by the scope that only admins will see.| Allow the application to have read-only access to all employee data.|
    | User consent display name| A short description of the scope's purpose. Shown to users only if you set Who can consent to Admins and users.| Read-only access to your employee records|
    | User consent description| A more detailed description of the permission granted by the scope. Shown to users only if you set Who can consent to Admins and users.| Allow the application to have read-only access to your employee data.|

1. Set the **State** to **Enabled**, and then select **Add scope**.

1. (Optional) To suppress prompting for consent by users of your app to the scopes you've defined, you can *pre-authorize* the client application to access your web API. Pre-authorize *only* those client applications you trust since your users won't have the opportunity to decline consent.

   1. Under **Authorized client applications**, select **Add a client application.**

   1. Enter the **Application (client) ID** of the client application you want to pre-authorize. For example, that of a web application you've previously registered.

   1. Under **Authorized scopes**, select the scopes for which you want to suppress consent prompting, then select **Add application**.

   1. If you followed this optional step, the client app is now a pre-authorized client app (PCA), and users won't be prompted for their consent when signing into it.

## Add a scope requiring admin consent

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

## Verify the exposed scopes

If you successfully added both example scopes described in the previous sections, they'll appear in the **Expose an API** pane of your web API's app registration, similar to this image:

![Screenshot of the Expose an API pane showing two exposed scopes.](./media/portal-03-scopes-list.png)

As shown in the image, a scope's full string is the concatenation of your web API's **Application ID URI** and the scope's **Scope name**.

For example, if your web API's application ID URI is `https://contoso.com/api` and the scope name is Employees.Read.All, the full scope is:

`https://contoso.com/api/Employees.Read.All`

## Using the exposed scopes

Next, you will configure a client app's registration with access to your web API and the scopes you defined by following the steps above.

Once a client app registration is granted permission to access your web API, the client can be issued an OAuth 2.0 access token by the Microsoft identity platform. When the client calls the web API, it presents an access token whose scope (scp) claim is set to the permissions you've specified in the client's app registration.

You can expose additional scopes later as necessary. Consider that your web API can expose multiple scopes associated with several operations. Your resource can control access to the web API at runtime by evaluating the scope (scp) claim(s) in the OAuth 2.0 access token it receives.
