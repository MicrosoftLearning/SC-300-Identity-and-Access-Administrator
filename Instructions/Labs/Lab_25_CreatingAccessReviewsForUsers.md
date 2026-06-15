---
lab:
  title: 25 - Creating Access Reviews for Internal and External Users
  learning path: '04'
  module: Module 04 - Plan and Implement and Identity Governance Strategy
  description: Privileged user access should be regularly reviewed in a similar manner. Automate this review of access rights using Microsoft Entra Access Review.
  duration: 5 minutes
  level: 200
  islab: true
---

# Lab 25 - Creating Access Reviews for Internal and External Users

### Login type: Microsoft 365 admin

## Lab scenario

Privileged user access should be regularly reviewed in a similar manner.  Since these are elevated access assignments, the review of these should be done on a consistent basis as identified by the company.  Unused and unnecessary privileged assignments should be removed.  Automated removal should also be configured for users that are no longer with the company or have changed departments within the company.

#### Estimated time: 5 minutes

### Exercise 1 - Create an internal Access review

#### Task - Create a new Access review

1. Sign in to **Microsoft Entra admin center** at **`https://entra.microsoft.com`** as your Global Administrator.

    >**Note:** You may be prompted to complete Multi-Factor Authentication (MFA) during sign-in. Follow the prompts to configure or verify your authentication method before continuing.

1. In the left navigation menu, expand the **ID Governance**, select **Access reviews**.

1. On the **Identity Governance | Access reviews** page, select **+ New access review**.

1. On the **Create an access review** page, under **Choose an Access Review** template, on the **Resource review** tile, select **Select**.

1. On the **New access review** page, under the **Select what to review**, open the **Select review** dropdown and select **Teams + Groups**.

1. Under the **Review scope**, select **Select Teams + groups**.

1. Under the **Group**, select **+ Select group(s)**.

1. From the **Select group** pane, select **Sales and Marketing** group from the list, and select **Select**.

1. Under the **Scope**, select **All users**.

1. Select **Next: Reviews** to move forward in the wizard.

    >**Note:** You can assign reviewers to perform self-reviews, group owners, managers, or selected users and groups. You can also configure what happens if a reviewer does not respond.

1. On the **Reviews** tab, under **Specify reviewers**, open the **Select reviewers** dropdown and select **Selected user(s) or group(s)**.

1. Under **Users or Groups**, select **+ Select reviewers**.

1. In the **Select reviewers** pane, search for **Alex Wilber**, select the user, and then select **Select**.

1. Under **Specify recurrence of review**, configure the following:
   - **Duration (in days)**: keep the default value
   - **Review recurrence**: **Annually**
   - **Start date**: keep the default value

1. Select **Next: Settings**.

1. On the **Settings** tab, review the available options and leave the default values unchanged.

1. Select **Next: Review + Create**.

1. On the **Review + Create** tab, enter **SC300 Access Review Test** for **Review name**.

1. Select **Create**.

  >**Note:** After the access review is created, it appears in the access reviews list, and the selected reviewers receive an email notification when the review starts.

### Exercise summary

In this exercise, you created an internal access review in the Microsoft Entra admin center. You defined the review scope, selected a reviewer, and configured a review schedule. This exercise showed how access reviews are used to regularly validate group access and support identity governance.
