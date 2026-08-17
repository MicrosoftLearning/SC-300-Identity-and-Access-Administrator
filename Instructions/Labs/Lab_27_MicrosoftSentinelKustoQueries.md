---
lab:
  title: 27 - Microsoft Sentinel Kusto Queries for Microsoft Entra data sources
  learning path: '04'
  module: Module 04 - Plan and Implement and Identity Governance Strategy
  description: Microsoft Sentinel is Microsoft's cloud-native SIEM and SOAR solution. Through connecting data sources from Microsoft and third-party security solutions, you have the ability to execute security operations tasks. In this lab exercise, you will create a Microsoft Sentinel workspace with data connectors to Microsoft Entra ID for executing hunting queries using Kusto Query Language (KQL).
  duration: 30 minutes
  level: 300
  islab: true
  primarytopics:
    - Microsoft Entra
    - Microsoft Entra ID
    - Microsoft Sentinel
---

# Lab 27 OPTIONAL – Microsoft Sentinel Kusto Queries for Microsoft Entra data sources

In this lab, you explore Microsoft Sentinel by working with Microsoft Entra ID data sources and running hunting queries using Kusto Query Language (KQL). You review how to connect data sources, create a Microsoft Sentinel workspace, and execute queries as part of security operations tasks.

> **Choose your path:**
>
> - **Live-results path:** If the subscription used for this lab allows you to create a Log Analytics workspace and enable Microsoft Sentinel, complete each task and verify the stated results.
> - **Guided-review path:** If resource creation or the Microsoft Entra ID connector is unavailable, follow each task to the point where the required control or configuration is visible, review the described settings, and do not submit the blocked action. Continue to the next task using the expected-results guidance.

### Login type: Azure resource login

## Lab scenario

Microsoft Sentinel is Microsoft's cloud-native SIEM and SOAR solution.  Through connecting data sources from Microsoft and third-party security solutions, you have the ability to execute security operations tasks.  In this lab exercise, you will create a Microsoft Sentinel workspace with data connectors to Microsoft Entra ID for executing hunting queries using Kusto Query Language (KQL). 

#### Estimated time: 30 minutes

### Exercise 1 - Configure Microsoft Sentinel for Kusto Queries

#### Task 1 - Create a Microsoft Sentinel workspace

1. Sign in to the Microsoft Azure portal at `https://portal.azure.com` as a Global administrator.

1. Search for and then select **Microsoft Sentinel**. 

1. Select **+ Create** in the upper left corner.

1. In the **Add Microsoft Sentinel to a workspace** tile, select **+ Create a new workspace**.

1. In **Resource group**, select **Create new** and enter **Sentinel-RG**.

1. Name the workspace.  Example - SentinelLogAnalytics.

1. Select a Region close to you.

1. Select **Review + Create** and then **Create**.

    > **Guided-review expected result:** The review page shows the selected subscription, **Sentinel-RG**, the workspace name, and region. In a live-results environment, validation succeeds and the deployment creates a Log Analytics workspace.

1. After the deployment completes, select **Go to resource**.

1. In the Microsoft Azure portal, search for and select **Microsoft Sentinel**.

1. Select **+ Create**, select the existing workspace that you created early, and then select **Add** to onboard the workspace to Microsoft Sentinel.

1. If prompted, select **OK** to activate the Microsoft Sentinel free trial.

    > **Guided-review expected result:** After onboarding, the workspace appears in Microsoft Sentinel with navigation for content, connectors, logs, incidents, and hunting. If onboarding is blocked, review these areas from the Microsoft Sentinel overview and continue to Task 2.

#### Task 2 - Add Microsoft Entra ID as a Data source

1. On the **Microsoft Sentinel**, in the left navigation menu, expand the **Content management**, and select **Content hub**.

1. Use the search box to look for **Entra** in the list of connectors, locate **Microsoft Entra ID** and mark the checkbox.

1. To the right, a preview tile will open.  Select **Install**.

1. After the install finishes, in the left navigation menu, expand the **Configuration**, and select **Data connectors**.

    >**Note:** You should show 1 Connector installed and see **Microsoft Entra ID** listed.

1. Select **Microsoft Entra ID** and then select **Open connector page**.

    > **Note:** Connecting this data source requires Global Administrator or Security Administrator permissions, plus permission to configure diagnostic settings on the tenant. If the account used for this lab doesn't have these permissions, use the guided-review path for the remaining steps in this task.

1. In the connector page, the instructions and next steps will be provided for the data connector. Verify that a check-mark is next to each of the **Prerequisites** to continue with the **Configuration**.

1. Under **Configuration**, check the boxes for **Sign-in logs** and **Audit logs**. Additional log sources are available but are currently in **Preview** and out of scope for this course.

1. Select **Apply Changes**. 

1. Notification will be provided that the changes were applied successfully. Navigate to the **Microsoft Sentinel** workspace by selecting the **X** on the top right of the connector page.

1. Select **Refresh** on the **Microsoft Sentinel | Data connectors** tile and the number 1 will show in the **Connected** count.

   >**Note:** The Microsoft Entra ID data connector may take a few minutes to show in the active count. 

    > **Guided-review expected result:** A configured connector shows the selected log categories and eventually reports a connected state. The connector sends Microsoft Entra sign-in and audit records to the workspace for querying.

#### Task 3 - Run Kusto query on User activity

1. In **Microsoft Sentinel**, navigate to **Logs** under the **General** menu heading.

1. Close the **Welcome to Log Analytics** window.

1. A window will open with sample queries, select **Audit**, and search to find **User IDs**.

1. Select **Run**. 

1. This will provide a list of User IDs on Microsoft Entra ID.  Since we have just created the workspace, you may not see results.  Note the format of the query.

    > **Guided-review expected result:** The query editor contains a KQL query against Microsoft Entra audit data. When data is available, the results table contains user identifiers and related activity fields. A new workspace can return no rows until data is ingested.

### Exercise summary

In this exercise, you reviewed the workflow for creating a Microsoft Sentinel workspace, connecting Microsoft Entra sign-in and audit logs, and querying identity activity with Kusto Query Language. When the required subscription capabilities and permissions were available, you also completed the live configuration and query.
