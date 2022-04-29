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

2. Access reviews can manage the access lifecycle.  Within **Privileged Identity Management**, this is found under the **Manage** menu.

3. Name the access review and set the start date and frequency. Duration is how long the access review will run before it expires.  You can set the end to be a specific date or after a number of occurrence.  Then select the user scope of the access review.

4. Select the scope for the roles that will be part of this scope.  You can add all roles or only select specific roles for certain reviews. 

5. The next step is to determine the reviewers.  These reviewers can be the member themselves to do a self-review or can be assigned to supervisors if reviewing access for an entire department. You can also set the action when a reviewer does not respond to automatically remove that privileged access from the member.

6. The advanced settings allow you to put a message as part of the review.  Select start to initiate the access review.

7. When the access review is created, the access review list will populate with the roles and owners of the reviews.

8. Members that are being reviewed will receive an email when the review is initiated.

9. Selecting an access review of one of the roles will provide status on these access reviews.

