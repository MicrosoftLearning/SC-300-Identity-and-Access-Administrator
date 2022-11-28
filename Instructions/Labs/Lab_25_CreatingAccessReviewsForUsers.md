---
lab:
    title: '25 - Creating Access Reviews for Internal and External Users'
    learning path: '04'
    module: 'Module 04 - Plan and Implement and Identity Governance Strategy'
---

# Lab 25 - Creating Access Reviews for Internal and External Users  

## Lab scenario

Privileged user access should be regularly reviewed in a similar manner.  Since these are elevated access assignments, the review of these should be done on a consistent basis as identified by the company.  Unused and unnecessary privileged assignments should be removed.  Automated removal should also be configured for users that are no longer with the company or have changed departments within the company.

#### Estimated time: 5 minutes

### Exercise 1 - Create an internal Access review

#### Task - Create a new Access review

1. Sign in to the [https://portal.azure.com](https://portal.azure.com) as a Global administrator.

2. Access reviews can manage the access lifecycle.  Within **Azure Active Directory**, find **Identity Governance** under the **Manage** menu.  In **Identity Goverance**, select **Access reviews**.

3. Select **+ New access review**.

4. In the **Select what to review** box choose **Teams + Groups** from the dropdown.

5. Select **Select Teams + groups** and pick the **Sales and Marketing** group from the list, and hit **Select**.

6. Set the **Scope** to **All users**.

7. Select the **Reviews** option for move forward in the wizard.

8. The next step is to determine the reviewers.  These reviewers can be the member themselves to do a self-review or can be assigned to supervisors if reviewing access for an entire department. You can also set the action when a reviewer does not respond to automatically remove that privileged access from the member.

9. Pick a reviewer and review recurrence option.  Then select **Settings**.

10. The advanced settings allow you to put a message as part of the review.

11. Select **Review and Creat** to finalize the access review.

12. Name the access review **SC300 Access Review Test**.

13. Select **Create**. When the access review is created, the access review list will populate with the roles and owners of the reviews.

14. Members that are being reviewed will receive an email when the review is initiated.

15. Selecting an access review of one of the roles will provide status on these access reviews.
