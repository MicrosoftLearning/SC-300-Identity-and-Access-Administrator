---
lab:
    title: 10 - Invite guest users in bulk'
    learning path: '01'
    module: 'Module 01 - Implement an identity management solution'
---

# Lab 10: Invite guest users in bulk

## Lab scenario

A recent partnership has been established with another company. For now, employees of the partner company will be added as guests. You need to ensure you can import multiple guest users at one time.

#### Estimated time: 10 minutes

### Exercise 1 - Invite guest users in bulk

#### Task - Bulk user invite

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as your Global Administrator.

2. In the navigation pane, select **Azure Active Directory**.

3. Under **Manage**, select **Users**.

4. On the Users blade, on the menu, select **Bulk operations > Bulk invite**.

     ![Screen image displaying the All user page with the Bulk operations and Bulk invite menu options highlighted](./media/lp1-mod3-bulk-invite-option.png)

5. In the Bulk invite users pane, select **Download** to a sample CSV template with invitation properties.

6. Using an editor to view the CSV file, review the template.

7. Open the .csv template and add a line for each guest user. Required values are:

    - **Email address to invite** - the user who will receive an invitation
    - **Redirection url** - the URL to which the invited user is forwarded after accepting the invitation.

    ![Screen image displaying the example bulk invite guests template CSV](./media/lp1-mod3-template-csv.png)

8. Save the file.

9. On the Bulk invite users page, under **Upload your csv file**, browse to the file.

     **Note** - When you select the file, validation of the .csv file starts.

10. After the file contents are validated, you will see **File uploaded successfully**. If there are errors, you must fix them before you can submit the job.

    ![Screen image displaying Bulk invite users with File uploaded successfully message highlighted](./media/lp1-mod3-bulk-invite-users-upload-csv.png)

11. When your file passes validation, select **Submit** to start the Azure bulk operation that adds the invitations.

12. To view the job status, select **Select here to view the status of each operation**. Or, you can select **Bulk operation results** in the Activity section. For details about each line item within the bulk operation, select the values under the **# Success**, **# Failure**, or **Total Requests** columns. If failures occurred, the reasons for failure will be listed.

    ![Screen image displaying the results of a bulk operation](./media/lp1-mod3-bulk-operations-results.png)

13. When the job completes, you will see a notification that the bulk operation succeeded.
