### Overview

We want to ensure that the "Merge Pull Request" button is disabled until the specified status checks (GitHub Actions workflows) have completed successfully on PRs. This will prevent merging PRs that have failing workflows.

### Prompt

Generate a rule on pull request to any branch. It should run the workflows. The "Merge Pull Request" button should be disabled until the workflows have completed successfully.

`@workspace Is possible to lock down the "Merge Pull Request" button on PR, when the GH Actions workflows are running? How can be do that?`

Copilot should answer something like:

```md
Yes, it is possible to lock down the "Merge Pull Request" button on a PR while GitHub Actions workflows are running by using branch protection rules. You can configure branch protection rules to require status checks to pass before merging.

Here is how you can do that:

Go to your repository on GitHub.
Click on the "Settings" tab.
In the left sidebar, click on "Branches".
Under "Branch protection rules", click "Add rule".
Specify the branch name pattern (e.g., main).
Check the "Require status checks to pass before merging" option.
Select the specific status checks (e.g., your GitHub Actions workflows) that must pass before merging.
Optionally, you can also check "Require branches to be up to date before merging" to ensure the branch is up to date with the base branch.
This will ensure that the "Merge Pull Request" button is disabled until the specified status checks (GitHub Actions workflows) have completed successfully.

For more details, you can refer to the [GitHub documentation on protected branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/managing-a-branch-protection-rule).
```
