---
lab:
    title: '27 - Microsoft Sentinel Kusto Queries for Microsoft Entra data sources'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 27 - Microsoft Sentinel Kusto Queries for Microsoft Entra data sources

**Note** - This lab requires an Azure Pass. Please see lab 00 for directions.

## Lab scenario

Microsoft Sentinel is Microsoft's cloud-native SIEM and SOAR solution.  Through connecting data sources from Microsoft and third-party security solutions, you have the ability to execute security operations tasks.  In this lab exercise, you will create a Microsoft Sentinel workspace with data connectors to Microsoft Entra ID for executing hunting queries using Kusto Query Language (KQL). 

#### Estimated time: 30 minutes

### Exercise 1 - Configure Microsoft Sentinel for Kusto Queries

#### Task 1 - Create a Microsoft Sentinel workspace

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator.

1. Search for and then select **Microsoft Sentinel**. 

1. Select **+ Create** in the upper left corner.

1. In the **Add Microsoft Sentinel to a workspace** tile, select **+ Create a new workspace**.

1. In **Resource group**, select **Create new** and enter **Sentinel-RG**.

1. Name the workspace.  Example - SentinelLogAnalytics.

1. Select a Region close to you.

1. Select **Review + Create** and then **Create**.

1. After the Log Analytics workspace deployment completes, choose the **Refresh** button. Then select your workspace and select **Add**.  This will add the workspace to Microsoft Sentinel and open Microsoft Sentinel.

1. If prompted, select **OK** to activate the Microsoft Sentinel free trial.

#### Task 2 - Add Microsoft Entra ID as a Data source
    **Note** - As of 2/8/2024, the data source is now Microsoft Entra ID.

1. In **Microsoft Sentinel**, navigate on the menu to **Content management** and select **Content hub**.

1. Use the search box to look for **Entra** in the list of connectors, locate **Microsoft Entra ID** and mark the checkbox.

1. To the right, a preview tile will open.  Select **Install**.

1. After the install finishes, select the **Data connectors** menu item in the Configuration menu.

    **Note** - You should show 1 Connector installed and see **Microsoft Entra ID** listed.

1. Select **Microsoft Entra ID** and then select **Open connector page**.

1. In the connector page, the instructions and next steps will be provided for the data connector. Verify that a check-mark is next to each of the **Prerequisites** to continue with the **Configuration**.

1. Under **Configuration**, check the boxes for **Sign-in logs** and **Audit logs**. Additional log sources are available but are currently in **Preview** and out of scope for this course.

1. Select **Apply Changes**. 

1. Notification will be provided that the changes were applied successfully. Navigate to the **Microsoft Sentinel** workspace by selecting the **X** on the top right of the connector page.

1. Select **Refresh** on the **Microsoft Sentinel | Data connectors** tile and the number 1 will show in the **Connected** count.

   **Note** - The Microsoft Entra ID data connector may take a few minutes to show in the active count. 

#### Task 3 - Run Kusto query on User activity

1. In **Microsoft Sentinel**, navigate to **Logs** under the **General** menu heading.

1. Close the **Welcome to Log Analytics** window.

1. A window will open with sample queries, select **Audit**, and search to find **User IDs**.

1. Select **Run**. 

1. This will provide a list of User IDs on Microsoft Entra ID.  Since we have just created the workspace, you may not see results.  Note the format of the query.
