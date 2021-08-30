---
lab:
    title: '25 - Create and manage a catalog of resources in Azure AD entitlement management'
    learning path: '04'
    module: 'Module 01 - Plan and implement entitlement management'
---

# Lab 25: Create and manage a catalog of resources in Azure AD entitlement management

## Lab scenario

A catalog is a container of resources and access packages. You create a catalog when you want to group related resources and access packages. Whoever creates the catalog becomes the first catalog owner. A catalog owner can add additional catalog owners. You must create and configure a catalog in your organization.

#### Estimated time: 15 minutes

## Create a catalog

1. Sign in to [https://portal.azure.com](https://portal.azure.com) using a Global Administrator account.

    >Important
    >To use and configure Azure AD terms of use, you must have:
    >
    >- Azure AD Premium P1, P2, EMS E3, or EMS E5 subscription.
    >- If you don't have one of these subscriptions, you can get Azure AD Premium or enable Azure AD Premium trial.
    >- One of the following administrator accounts for the directory you want to configure:
    >    - Global Administrator
    >    - Security Administrator
    >    - Conditional Access Administrator

1. Open **Azure Active Directory** and the select **Identity Governance**.

1. In the left menu, under **Entitlement management**, select **Catalogs**.

1. On the top menu, select **+New Catalog**.

    ![Screen image displaying the Identity governance catalog page with the New catalog menu highlighted ](./media/lp4-mod1-identity-governance-new-catalog.png)

1. In the New catalog pane, in the **Name** box, enter **Marketing**.

1. In the **Description** box, enter **For marketing department users**. Users will see this information in an access package's details.

1. **Enabled for external users** allows users in selected external directories to be able to request access packages in this catalog. No changes will be made to this setting.

1. Under **Enabled, select No**.

1. You may choose to enable the catalog for immediate use or disable if you intend to stage it or keep it unavailable until you intend to use it. For this exercise, the catalog does not need to be enabled.

    ![Screen image displaying the New catalog pan with the Name, Description, Enabled, and Create options highlighted](./media/lp4-mod1-new-catalog-marketing.png)

1. Select Create.

## Add resources to a catalog

To include resources in an access package, the resources must exist in a catalog. The types of resources you can add are groups, applications, and SharePoint Online sites. The groups can be cloud-created Microsoft 365 Groups or cloud-created Azure AD security groups. The applications can be Azure AD enterprise applications, including both SaaS applications and your own applications federated to Azure AD. The sites can be SharePoint Online sites or SharePoint Online site collections.

1. On the Identity Governance blade, if necessary, select **Catalogs**.

1. In the **Catalogs** list, select **Marketing**.

1. In the left navigation, under **Manage**, select **Resources**.

1. On the menu, select + **Add resources**.

1. In the Add resources to catalog blade, review the available options.  Add the following items:

| Resource Type | Value |
| :------------- | :---------- |
|  **Groups and Teams** | Retail |
|  **Applications** | Box |
|  **Applications** | Salesforce |
|  **SharePoint sites** | Brand SharePoint <<<pick from your list of available SharePoint sites |

1. You may not have any resources in Groups and Teams, Applications, or SharePoint sites. Select any resource category and then select a resource from that category.

1. For this exercise, it is okay to choose any resource you may have available.

    ![Add resources to a catalog](./media/catalog-add-resources.png)

1. When finished, click **Add**. These resources can now be included in access packages within the catalog.

## Add additional catalog owners

The user that created a catalog becomes the first catalog owner. To delegate management of a catalog, you add users to the catalog owner role. This helps share the catalog management responsibilities.

1. In the Marketing catalog blade, in the left navigation menu, select Roles and administrators.

1. If necessary, in the Azure portal, browse to **Azure Active Directory** > **Identity Governance > Catalogs** and then select **Marketing**.

    ![Screen image displaying the Roles and administrators page for the Marketing catalog](./media/lp4-mod1-catalog-roles-and-admins.png)

1. On the top menu, review the available roles and then select **+ Add catalog owner**.

1. In the Select members pane, select your **Adele Vance** and then select **Select**.

1. Review the newly added role in the Roles and administrators list.

## Edit a catalog

You can edit the name and description for a catalog. Users see this information in an access package's details.

1. In the Marketing blade, in the left navigation, select **Overview**.

1. On the top menu, select **Edit**.

1. Review the setting and, under **Properties** > **Enabled**, select **Yes**.

    ![Screen image displaying the properties being enabled.](./media/lp4-mod1-edit-marketing-catalog.png)

1. Select **Save**.

## Delete a catalog

You can delete a catalog, but only if it does not have any access packages.

1. In the Marketing catalog’s Overview page, on the top menu, select Delete.

1. In the Delete dialog box, review the information and then select **No**.

    **Note** - we are keeping the catalog for use in the next lab.
